import 'package:flutter/material.dart';
import 'package:smart_driver/core/styles/colors.dart';
import 'package:smart_driver/features/race_detalis/presentation/details_screen.dart';

class RaceCardWidget extends StatelessWidget {
  final Color cardColor;
  final String raceName;
  final String raceTime;
  final String raceStatus;

  const RaceCardWidget(
      {super.key,
      required this.cardColor,
      required this.raceName,
      required this.raceTime,
      required this.raceStatus});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => DetailsScreen()));
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: cardColor,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              Text(
                raceName,
                style: const TextStyle(
                    fontSize: 24,
                    color: AppColors.black,
                    fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              Text(
                raceTime,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ]),
            const SizedBox(
              height: 12,
            ),
            Text(
              'Статус заказа: $raceStatus',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            )
          ]),
        ),
      ),
    );
  }
}
