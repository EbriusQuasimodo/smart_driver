import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_driver/features/auth/data/fake_auth_repository.dart';
import 'package:smart_driver/features/auth/presentation/auth_screen.dart';
import 'package:smart_driver/features/profile/presentation/profile_screen.dart';
import 'package:smart_driver/features/races/presentation/races_screen.dart';

import 'go_router_refresh_screen.dart';
import 'root_screen.dart';

enum AppRoute {
  loginPage,
  racesPage,
  detailsPage,
  profilePage,
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorAKey = GlobalKey<NavigatorState>(debugLabel: 'shellA');
final _shellNavigatorBKey = GlobalKey<NavigatorState>(debugLabel: 'shellB');
//final _shellNavigatorCKey = GlobalKey<NavigatorState>(debugLabel: 'shellC');
final _shellNavigatorDKey = GlobalKey<NavigatorState>(debugLabel: 'shellD');
final _shellNavigatorFKey = GlobalKey<NavigatorState>(debugLabel: 'shellF');

final goRouterProvider = Provider.autoDispose<GoRouter>((ref) {
  final authRepository = ref.watch(fakeAuthRepositoryProvider);
  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    redirect: (context, GoRouterState state) {
      final isLoggedIn = authRepository.currentUser != null;
      print(isLoggedIn);
      if (isLoggedIn) {
        if (state.uri.toString() == '/') {
          return '/races';
        }
      } else {
        return '/';
      }
      return null;
    },
    refreshListenable: GoRouterRefreshStream(authRepository.authStateChanges()),
    routes: [
      GoRoute(
        path: '/',
        name: AppRoute.loginPage.name,
        builder: (context, state) => AuthScreen(),
        routes: const [],
      ),
      // BottomNavigationBar
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            RootScreen(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            navigatorKey: _shellNavigatorAKey,
            routes: [
              GoRoute(
                path: '/races',
                builder: (context, state) => const RacesScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorBKey,
            routes: [
              GoRoute(
                path: '/profile',
                builder: (context, state) => const ProfileScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
});
