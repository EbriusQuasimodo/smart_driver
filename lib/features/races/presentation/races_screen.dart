import 'package:flutter/material.dart';
import 'package:smart_driver/core/styles/colors.dart';
import 'package:smart_driver/features/races/presentation/widgets/race_card_widget.dart';

class RacesScreen extends StatelessWidget {
  const RacesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return const Column(
                    children: [
                      RaceCardWidget(
                          cardColor: AppColors.yellow,
                          raceName: 'Заход 1',
                          raceTime: 'До 16:30',
                          raceStatus: 'Готов к доставке'),
                      SizedBox(
                        height: 10,
                      ),
                      RaceCardWidget(
                          cardColor: AppColors.red,
                          raceName: 'Заход 2',
                          raceTime: 'До 17:30',
                          raceStatus: 'Готовится'),
                      SizedBox(
                        height: 10,
                      ),
                      RaceCardWidget(
                          cardColor: AppColors.darkGray,
                          raceName: 'Заход 3',
                          raceTime: 'До 18:30',
                          raceStatus: 'Создан'),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  );
                },
                childCount: 1,
              ),
            ),
          ),
        ],
      ),
    ));
  }
}