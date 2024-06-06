import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_driver/core/styles/colors.dart';
import 'package:smart_driver/features/auth/presentation/auth_controller.dart';
import 'package:smart_driver/features/auth/widgets/custom_wave_clipper.dart';

class AuthScreen extends ConsumerWidget {
  AuthScreen({super.key});

  final formGlobalKey = GlobalKey<FormState>();
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue>(
      loginScreenControllerProvider,
      (_, state) {
        if (!state.isLoading && state.hasError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error.toString())),
          );
        }
      },
    );
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipPath(
                clipper: CustomWaveClipper(),
                child: Container(
                  decoration: const BoxDecoration(color: AppColors.yellow),
                  height: 300,
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
                  'Авторизация',
                  style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w900,
                      color: AppColors.white),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 16.0, left: 16, right: 16),
                child: Form(
                  key: formGlobalKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Text(
                          'Логин',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors.white),
                        ),
                      ),
                      TextFormField(
                        controller: loginController,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Введите логин';
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
                      const Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Text(
                          'Пароль',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors.white),
                        ),
                      ),
                      TextFormField(
                        controller: passwordController,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Введите пароль';
                          }
                          return null;
                        },
                        style: const TextStyle(
                            color: AppColors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(
                    left: 16.0, right: 16, top: 10, bottom: 16),
                child: ElevatedButton(
                    onPressed: () {
                      if (formGlobalKey.currentState!.validate()) {
                        ref
                            .read(loginScreenControllerProvider.notifier)
                            .signInAnonymously(loginController.text,
                                passwordController.text, '1');
                      }
                    },
                    child: Text('Войти')),
              ),
              Container(
                  width: double.infinity,
                  margin:
                      const EdgeInsets.only(left: 16.0, right: 16, bottom: 16),
                  child: OutlinedButton(
                      onPressed: () {},
                      child: Text('Зарегестрировать организацию'))),
              
              Container(
                  alignment: Alignment.center,
                  margin:
                      const EdgeInsets.only(left: 16.0, right: 16, bottom: 16),
                  child: TextButton(
                      onPressed: () {}, child: Text('Посмотреть тарифы')))
            ],
          ),
        ),
      ),
    );
  }
}
