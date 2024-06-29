import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_driver/core/routing/routing.dart';
import 'package:smart_driver/core/styles/colors.dart';
import 'package:smart_driver/features/race_detalis/domain/app_location.dart';
import 'package:smart_driver/features/race_detalis/domain/default_location.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class DetailsScreen extends ConsumerStatefulWidget {
  const DetailsScreen({super.key});

  @override
  ConsumerState<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends ConsumerState<DetailsScreen> {
  List<AppLatLong> ordersPoints = [
    AppLatLong(long: 61.387381, lat: 55.144639),
    // AppLatLong(long: 61.383308, lat: 55.154205),
    AppLatLong(long: 61.433617, lat: 55.161347)
  ];
  late String signedString;

  ///лист с объектами карты
  final List<MapObject> mapObjects = [];

  final mapControllerCompleter = Completer<YandexMapController>();

  late YandexMapController controller;

  bool showTrafficLayer = false;

  final MapObjectId mapObjectIdPolyline = const MapObjectId('polyline');
  final MapObjectId mapObjectIdFirstMarker = const MapObjectId('first_marker');
  MapObjectId? mapObjectIdSecondMarker;

  late AppLatLong location;

  ///уровень пробок
  int level = 0;

  ///цвет трафика на дороге
  Color trafficColor = Colors.white;

  ///список в котором хранится маршрут
  final List<DrivingSessionResult> results = [];

  bool progress = true;

  DrivingSessionResult? resultWithSession;

  @override
  void initState() {
    initializeMap();
    super.initState();
    //crypt();
  }

  void initializeMap() async {
    ///получение маршрута
    await getRouteYandexDriving();

    ///получение маркеров
    await getPlacemarks();

    ///инициализация разрешения на геолокацию и запуск анимации приближения к пользователю
    _initPermission().ignore();
  }

  ///перемещение камеры к текущему местоположению
  Future<void> _moveToCurrentLocation(AppLatLong appLatLong) async {
    (await mapControllerCompleter.future).moveCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: Point(
            latitude: appLatLong.lat,
            longitude: appLatLong.long,
          ),
          zoom: 17,
        ),
      ),
      animation: const MapAnimation(type: MapAnimationType.linear, duration: 1),
    );
  }

  ///----------------------------------------------------------------------------

  ///получение разрешения на геолокацию если оно не получено
  Future<void> _initPermission() async {
    if (!await LocationService().checkPermission()) {
      await LocationService().requestPermission();
    }
    await _fetchCurrentLocation();
  }

  ///----------------------------------------------------------------------------

  /// Получение текущей геопозиции пользователя
  Future<void> _fetchCurrentLocation() async {
    AppLatLong location;
    const defLocation = MoscowLocation();
    try {
      location = await LocationService().getCurrentLocation();
    } catch (_) {
      location = defLocation as AppLatLong;
    }
    _moveToCurrentLocation(location);
  }

  ///----------------------------------------------------------------------------

  ///получаем цвет трафика и возвращаем его в переменную для хранения цвета трафика
  Color _colorFromTraffic(TrafficColor trafficColor) {
    switch (trafficColor) {
      case TrafficColor.red:
        return Colors.red;
      case TrafficColor.yellow:
        return Colors.yellow;
      case TrafficColor.green:
        return Colors.green;
      default:
        return Colors.white;
    }
  }

  ///получение маршрута от яндекса
  Future<void> getRouteYandexDriving() async {
    location = await LocationService().getCurrentLocation();

    var resultWithSession = await YandexDriving.requestRoutes(
      points: [
        RequestPoint(
            point: Point(
              latitude: location.lat,
              longitude: location.long,
            ),
            requestPointType: RequestPointType.wayPoint),
        for (int i = 0; i < ordersPoints.length; i++) ...[
          RequestPoint(
              point: Point(
                latitude: ordersPoints[i].lat,
                longitude: ordersPoints[i].long,
              ),
              requestPointType: RequestPointType.wayPoint)
        ]
      ],
      drivingOptions: const DrivingOptions(
          initialAzimuth: 0, routesCount: 1, avoidTolls: false),
    );

    _initRoute(resultWithSession.$1, resultWithSession.$2);
  }

  ///----------------------------------------------------------------------------

  ///инициализация маршрута
  Future<void> _initRoute(
      DrivingSession session, Future<DrivingSessionResult> result) async {
    await _handleResult(await result);
  }

  ///----------------------------------------------------------------------------

  ///запись полученного маршрута в список List<DrivingSessionResult> results
  ///и построение PolylineMapObject
  Future<void> _handleResult(DrivingSessionResult result) async {
    setState(() {
      progress = false;
    });

    if (result.error != null) {
      print('Error: ${result.error}');
      return;
    }

    setState(() {
      results.add(result);
    });
    setState(() {
      result.routes!.asMap().forEach((i, route) {
        mapObjects.add(PolylineMapObject(
          mapId: MapObjectId('route_${i}_polyline'),
          polyline: route.geometry,
          strokeColor:
              Colors.primaries[Random().nextInt(Colors.primaries.length)],
          strokeWidth: 3,
        ));
      });
    });
  }

  ///----------------------------------------------------------------------------

  ///получение маркеров
  getPlacemarks() async {
    location = await LocationService().getCurrentLocation();

    ///маркер начальной точки
    final placeMarkFirst = PlacemarkMapObject(
      mapId: mapObjectIdFirstMarker,
      point: Point(latitude: location.lat, longitude: location.long),
      icon: PlacemarkIcon.single(
        PlacemarkIconStyle(
          image: BitmapDescriptor.fromBytes(await _rawPlacemarkImage()),
          scale: 0.8,
        ),
      ),
      opacity: 1,
    );
    setState(() {
      mapObjects.add(placeMarkFirst);
    });

    ///
    List<PlacemarkMapObject> markers = [];
    for (int i = 0; i < ordersPoints.length; i++) {
      mapObjectIdSecondMarker = MapObjectId('marker_$i');

      markers.add(PlacemarkMapObject(
        mapId: mapObjectIdSecondMarker ?? MapObjectId('marker_$i'),
        point: Point(
            latitude: ordersPoints[i].lat, longitude: ordersPoints[i].long),
        icon: PlacemarkIcon.single(
          PlacemarkIconStyle(
            image: BitmapDescriptor.fromBytes(await _rawPlacemarkImage()),
            scale: 0.8,
          ),
        ),
        opacity: 1,
      ));
    }
    setState(() {
      mapObjects.addAll(markers);
    });

    print(mapObjects.length);

    ///
  }

  ///----------------------------------------------------------------------------
  Future<Uint8List> _rawPlacemarkImage() async {
    final recorder = PictureRecorder();
    final canvas = Canvas(recorder);
    const size = Size(50, 50);
    final fillPaint = Paint()
      ..color = Colors.blue[100]!
      ..style = PaintingStyle.fill;
    final strokePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    const radius = 20.0;

    final circleOffset = Offset(size.height / 2, size.width / 2);

    canvas.drawCircle(circleOffset, radius, fillPaint);
    canvas.drawCircle(circleOffset, radius, strokePaint);

    final image = await recorder
        .endRecording()
        .toImage(size.width.toInt(), size.height.toInt());
    final pngBytes = await image.toByteData(format: ImageByteFormat.png);

    return pngBytes!.buffer.asUint8List();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 47,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 55,
        
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: GestureDetector(
            onTap: (){ref.read(goRouterProvider).pop();},
            child: Container(
           padding: EdgeInsets.only(left: 8),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(14),color: AppColors.black.withOpacity(0.9)),
              child:  const Icon(Icons.arrow_back_ios,
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: YandexMap(
              nightModeEnabled: true,
              onMapCreated: (yandexMapController) async {
                mapControllerCompleter.complete(yandexMapController);
                controller = yandexMapController;
              },
              onTrafficChanged: (TrafficLevel? trafficLevel) {
                setState(() {
                  level = trafficLevel?.level ?? 0;
                  trafficColor = trafficLevel != null
                      ? _colorFromTraffic(trafficLevel.color)
                      : Colors.white;
                });
              },
              mapObjects: mapObjects,
            ),
          ),
        ],
      ),
    );
  }
}
