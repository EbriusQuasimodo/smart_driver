import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_driver/core/styles/colors.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key, required this.navigationShell});

  /// Контейнер для навигационного бара.
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        /// Лист элементов для нижнего навигационного бара.
        items: _buildBottomNavBarItems,
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
  List<BottomNavigationBarItem> get _buildBottomNavBarItems => [
    const BottomNavigationBarItem(
      activeIcon:Icon(Icons.drive_eta_sharp, color: AppColors.yellow,),
      icon: Icon(Icons.drive_eta_sharp, color: AppColors.white,),
      label: 'Заезды',
    ),
    const BottomNavigationBarItem(
      activeIcon: Icon(Icons.person_2_sharp, color: AppColors.yellow,),
      icon: Icon(Icons.person_2_sharp,color:AppColors.white),
      label: 'Профиль',
    ),
  ];
}