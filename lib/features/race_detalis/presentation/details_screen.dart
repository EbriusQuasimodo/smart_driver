import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:smart_driver/features/race_detalis/domain/app_location.dart';
import 'package:smart_driver/features/race_detalis/domain/default_location.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
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
  final MapObjectId mapObjectIdSecondMarker =
      const MapObjectId('second_marker');


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
   
    ///получение маршрута
    getRouteYandexDriving();

    ///получение маркеров
    getPlacemarks();

     ///инициализация разрешения на геолокацию и запуск анимации приближения к пользователю
     _initPermission().ignore();
   

    super.initState();
    //crypt();
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

    _initRoute(resultWithSession.$1,resultWithSession.$2);
  }

  ///----------------------------------------------------------------------------

  ///инициализация маршрута
  Future<void> _initRoute(
    DrivingSession session , Future<DrivingSessionResult> result
  ) async {
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
          mapId: mapObjectIdPolyline,
          polyline: route.geometry,
          strokeColor: Colors.blue,
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
          image: BitmapDescriptor.fromAssetImage(
            'assets/images/Car_icon_alone.png',
          ),
          scale: 0.5,
        ),
      ),
      opacity: 1,
    );
    setState(() {
      mapObjects.add(placeMarkFirst);
    });

    ///

    for (int i = 0; i < ordersPoints.length; i++) {
      setState(() {
        mapObjects.add(PlacemarkMapObject(
          mapId: MapObjectId('marker_$i'),
          point: Point(
              latitude: ordersPoints[i].lat, longitude: ordersPoints[i].long),
          icon: PlacemarkIcon.single(
            PlacemarkIconStyle(
              image: BitmapDescriptor.fromAssetImage(
                'assets/images/25694.png',
              ),
              scale: 1,
            ),
          ),
          opacity: 1,
        ));
      });
    }
    print(mapObjects.length);
    // /// маркер конечной точки
    // final placeMarkSecond = PlacemarkMapObject(
    //   mapId: mapObjectIdSecondMarker,
    //   point: Point(latitude: widget.alarm.lat, longitude: widget.alarm.lng),
    //   icon: PlacemarkIcon.single(
    //     PlacemarkIconStyle(
    //       image: BitmapDescriptor.fromAssetImage(
    //         'assets/icons/endRoute.png',
    //       ),
    //       scale: 0.5,
    //     ),
    //   ),
    //   opacity: 1,
    // );
    // setState(() {
    //   mapObjects.add(placeMarkSecond);
    // });

    ///
  }

  ///----------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: YandexMap(
            onMapCreated: (yandexMapController) {
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
