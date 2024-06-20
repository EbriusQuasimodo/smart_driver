import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_driver/core/styles/colors.dart';
import 'package:smart_driver/features/auth/widgets/custom_wave_clipper.dart';
import 'package:smart_driver/features/registration/presentation/branches_screen.dart';
import 'package:smart_driver/features/registration/presentation/registration_controller.dart';

class RegistrationScreen extends ConsumerWidget {
  RegistrationScreen({super.key});
  final formGlobalKey = GlobalKey<FormState>();

  TextEditingController bracnhesCountController = TextEditingController();
  TextEditingController orgNameController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
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
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Регистрация',
                style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w900,
                    color: AppColors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0, left: 16, right: 16),
              child: Form(
                key: formGlobalKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Название',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.white),
                      ),
                      const SizedBox(
                      height: 4,
                    ),
                      TextFormField(
                        controller: orgNameController,
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            ref
                                .read(organizationNameStateProvider.notifier)
                                .state = value;
                          }
                        },
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Введите название';
                          }
                          return null;
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
                        'Количество филиалов',
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
                        controller: bracnhesCountController,
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            ref
                                .read(branchesCountStateProvider.notifier)
                                .state = int.parse(value);
                          } else {
                            ref
                                .read(branchesCountStateProvider.notifier)
                                .state = 0;
                          }
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
                        margin: const EdgeInsets.only(top: 10, bottom: 16),
                        child: ElevatedButton(
                            onPressed: ref.watch(branchesCountStateProvider) !=
                                    0
                                ? () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (BuildContext context) {
                                      return BranchesScreen();
                                    }));
                                  }
                                : null,
                            child: Text('Продолжить')),
                      ),
                    ]),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
