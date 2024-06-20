import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_driver/core/styles/colors.dart';
import 'package:smart_driver/features/auth/widgets/custom_wave_clipper.dart';
import 'package:smart_driver/features/registration/presentation/info_check_screen.dart';

import 'registration_controller.dart';

class BranchesScreen extends ConsumerWidget {
  const BranchesScreen({super.key});



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController courierCountController = TextEditingController();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipPath(
                  clipper: CustomWaveClipper(),
                  child: Container(
                    decoration: const BoxDecoration(color: AppColors.yellow),
                    height: 200,
                    child: const Center(
                      child: Text(
                        'Smart Driver',
                        style: const TextStyle(
                            fontSize: 44,
                            fontWeight: FontWeight.w900,
                            color: AppColors.white),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Заполните информацию о филиалах',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white),
                  ),
                ),
              ],
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            childCount: ref.watch(branchesCountStateProvider),
            (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: AppColors.black,
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Адрес',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.white),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    TextFormField(
                      style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Название',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.white),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    TextFormField(
                      style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                       Text(
                        'Количество курьеров в филиале',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.white),
                      ),
                      const SizedBox(
                      height: 4,
                    ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: courierCountController,
                        onChanged: (value) {
                         
                        },
                        style: const TextStyle(
                            color: AppColors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(
                        top: 10,
                      ),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom().copyWith(
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color?>(
                                    (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed)) {
                                return AppColors.darkGray;
                              }
                              if (states.contains(MaterialState.disabled)) {
                                return AppColors.black;
                              }

                              return AppColors.darkestGray;
                            }),
                            overlayColor:
                                MaterialStateProperty.resolveWith<Color?>(
                                    (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed)) {
                                return AppColors.darkGray;
                              }

                              return AppColors.darkestGray;
                            }),
                          ),
                          onPressed: () {},
                          child: Text('Добавить зону доставки')),
                    ),
                  ],
                ),
              );
            },
          )),
          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 10, bottom: 46,left: 16,right: 16),
              child: ElevatedButton(
                  onPressed:  () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) {
                            return InfoCheckScreen();
                          }));
                        },
                  child: Text('Продолжить')),
            ),
          ),
        ],
      ),
    );
  }
}
