import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_driver/core/routing/routing.dart';
import 'package:smart_driver/core/styles/app_theme.dart';
import 'package:smart_driver/features/auth/presentation/auth_screen.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    return MaterialApp.router(
      theme: AppTHemeData().themeData(context),
routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
      
    );
  }
}
