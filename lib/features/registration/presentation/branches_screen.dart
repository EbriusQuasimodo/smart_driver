import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_driver/core/styles/colors.dart';
import 'package:smart_driver/features/auth/widgets/custom_wave_clipper.dart';
import 'package:smart_driver/features/registration/presentation/info_check_screen.dart';

import 'registration_controller.dart';

class BranchesScreen extends ConsumerStatefulWidget {
  const BranchesScreen({super.key});

  @override
  ConsumerState<BranchesScreen> createState() => _BranchesScreenState();
}

class _BranchesScreenState extends ConsumerState<BranchesScreen> {
  Widget build(
    BuildContext context,
  ) {
    // PageController controller = PageController();
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
                      onChanged: (val) {
                        setState(() {
                          ref
                              .read(orgInfoStateProvider)
                              .branches?[index]
                              .adress = val;
                        });
                      },
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
                      onChanged: (val) {
                        setState(() {
                          ref.read(orgInfoStateProvider).branches?[index].name =
                              val;
                        });
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
                    SizedBox(
                      height: 22,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: ElevatedButton(
                                onPressed: () {}, child: Text('Сохранить')))
                      ],
                    )
                  ],
                ),
              );
            },
          )),
          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.only(
                  top: 10, bottom: 46, left: 16, right: 16),
              child: ElevatedButton(
                  onPressed:
                      (ref.watch(orgInfoStateProvider).branches ?? []).length >
                              ref.watch(branchesCountStateProvider)
                          ? () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) {
                                return InfoCheckScreen();
                              }));
                            }
                          : null,
                  child: Text('Продолжить')),
            ),
          ),
        ],
      ),
    );
  }
}
