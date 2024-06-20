import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_driver/core/styles/colors.dart';
import 'package:smart_driver/features/auth/data/fake_auth_repository.dart';

class RootScreen extends ConsumerWidget {
  const RootScreen({super.key, required this.navigationShell});

  /// Контейнер для навигационного бара.
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
      final currentUser = ref.watch(fakeAuthRepositoryProvider).currentUser;
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        /// Лист элементов для нижнего навигационного бара.
        items: [
          const BottomNavigationBarItem(
      activeIcon:Icon(Icons.drive_eta_sharp, color: AppColors.yellow,),
      icon: Icon(Icons.drive_eta_sharp, color: AppColors.white,),
      label: 'Заезды',
    ),
    if(currentUser?.role =='senior courier'||currentUser?.role =='admin')
    const BottomNavigationBarItem(
      
      activeIcon: Icon(Icons.map, color: AppColors.yellow,),
      icon: Icon(Icons.map,color:AppColors.white),
      label: 'Курьеры',
      
    ),
    const BottomNavigationBarItem(
      activeIcon: Icon(Icons.person_2_sharp, color: AppColors.yellow,),
      icon: Icon(Icons.person_2_sharp,color:AppColors.white),
      label: 'Профиль',
    ),
        ],
        selectedLabelStyle: TextStyle(color: AppColors.yellow),
        unselectedLabelStyle: TextStyle(color: AppColors.white),
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

  // // Возвращает лист элементов для нижнего навигационного бара.
  // List<BottomNavigationBarItem> get _buildBottomNavBarItems => [
  //   const BottomNavigationBarItem(
  //     activeIcon:Icon(Icons.drive_eta_sharp, color: AppColors.yellow,),
  //     icon: Icon(Icons.drive_eta_sharp, color: AppColors.white,),
  //     label: 'Заезды',
  //   ),
  //   if(currentUser.)
  //   const BottomNavigationBarItem(
  //     activeIcon: Icon(Icons.person_2_sharp, color: AppColors.yellow,),
  //     icon: Icon(Icons.person_2_sharp,color:AppColors.white),
  //     label: 'Профиль',
  //   ),
  // ];
}