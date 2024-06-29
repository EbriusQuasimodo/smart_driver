import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_driver/core/routing/routing.dart';
import 'package:smart_driver/core/styles/colors.dart';
import 'package:smart_driver/core/ui/expandable_fab/src/action_button_builder.dart';
import 'package:smart_driver/core/ui/expandable_fab/src/expandable_fab.dart';
import 'package:smart_driver/features/auth/data/fake_auth_repository.dart';
import 'package:smart_driver/features/courier_map/presentation/courier_map_screen.dart';

class RootScreen extends ConsumerWidget {
  RootScreen({super.key, required this.navigationShell});

  /// Контейнер для навигационного бара.
  final StatefulNavigationShell navigationShell;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(fakeAuthRepositoryProvider).currentUser;
    return Scaffold(
      body: navigationShell,
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: (currentUser?.role == 'admin' ||
                  currentUser?.role == 'senior courier') &&
              ref.watch(pageOpenStateProvider) !=
                  GoRouterState.of(context).uri.path
          ? ExpandableFab(
              fanAngle: 0,
              distance: 60,
              overlayStyle: ExpandableFabOverlayStyle(blur: 10),
              type: ExpandableFabType.up,
              openButtonBuilder: DefaultFloatingActionButtonBuilder(
                heroTag: null,
                child: const Text(
                  'Меню',
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white),
                ),
                fabSize: ExpandableFabSize.regular,
                foregroundColor: AppColors.white,
                backgroundColor: AppColors.pressedYellow,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              closeButtonBuilder: DefaultFloatingActionButtonBuilder(
                child: const Text(
                  'Меню',
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white),
                ),
                fabSize: ExpandableFabSize.regular,
                foregroundColor: AppColors.white,
                backgroundColor: AppColors.pressedYellow,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              children: [
                  ElevatedButton(
                      onPressed: () {}, child: Text('Создать заказ')),
                  ElevatedButton(
                      onPressed: () {}, child: Text('Создать заход')),
                  ElevatedButton(onPressed: () {}, child: Text('Все заказы')),
                  ElevatedButton(
                      onPressed: () {
                        ref.read(pageOpenStateProvider.notifier).state =
                            '/courier_map';
                        ref.read(goRouterProvider).push('/courier_map').then(
                            (value) => ref
                                .read(pageOpenStateProvider.notifier)
                                .state = '');
                      },
                      child: Text('Курьеры')),
                ])
          : SizedBox.shrink(),
      bottomNavigationBar: BottomNavigationBar(
        /// Лист элементов для нижнего навигационного бара.
        items: [
          const BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.drive_eta_sharp,
              color: AppColors.yellow,
            ),
            icon: Icon(
              Icons.drive_eta_sharp,
              color: AppColors.white,
            ),
            label: 'Заезды',
          ),
          const BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.person_2_sharp,
              color: AppColors.yellow,
            ),
            icon: Icon(Icons.person_2_sharp, color: AppColors.white),
            label: 'Профиль',
          ),
        ],
        selectedLabelStyle: TextStyle(color: AppColors.yellow),
        unselectedLabelStyle: TextStyle(color: AppColors.white),
        unselectedItemColor: AppColors.white,

        /// Текущий индекс нижнего навигационного бара.
        currentIndex: navigationShell.currentIndex,

        /// Обработчик нажатия на элемент нижнего навигационного бара.
        onTap: (index) => navigationShell.goBranch(
          index,
          initialLocation: index == navigationShell.currentIndex,
        ),
      ),
    );
  }

  // Возвращает лист элементов для нижнего навигационного бара.
  List<BottomNavigationBarItem> buildBottomNavBarItems(WidgetRef ref) {
    return [
      const BottomNavigationBarItem(
        activeIcon: Icon(
          Icons.drive_eta_sharp,
          color: AppColors.yellow,
        ),
        icon: Icon(
          Icons.drive_eta_sharp,
          color: AppColors.white,
        ),
        label: 'Заезды',
      ),
      const BottomNavigationBarItem(
        activeIcon: Icon(
          Icons.person_2_sharp,
          color: AppColors.yellow,
        ),
        icon: Icon(Icons.person_2_sharp, color: AppColors.white),
        label: 'Профиль',
      ),
    ];
  }
}
