import 'package:flutter/material.dart';
import 'package:smart_driver/core/styles/colors.dart';
import 'package:smart_driver/core/ui/decorated_input_border.dart';

class AppTHemeData {
  ThemeData themeData(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Inter',
      colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.yellow, background: AppColors.bgBlack),
      scaffoldBackgroundColor: AppColors.bgBlack,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.bgBlack,
        titleTextStyle: TextStyle(
            color: AppColors.white, fontSize: 20, fontWeight: FontWeight.w600),
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: AppColors.bgBlack,
        filled: true,
        iconColor: AppColors.white,
        isDense: true,
        errorMaxLines: 4,
        hoverColor: Colors.transparent,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        hintStyle:
            const TextStyle(color: AppColors.darkGray, fontWeight: FontWeight.w400),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.darkestGray),
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: DecoratedInputBorder(
          child: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.red),
            borderRadius: BorderRadius.circular(8),
          ),
          shadow: BoxShadow(
            color: AppColors.red.withOpacity(0.2),
            spreadRadius: 2,
          ),
        ),
        focusedErrorBorder: DecoratedInputBorder(
          child: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.red),
            borderRadius: BorderRadius.circular(8),
          ),
          shadow: BoxShadow(
            color: AppColors.red.withOpacity(0.2),
            spreadRadius: 2,
          ),
        ),
        outlineBorder: const BorderSide(color: AppColors.darkestGray),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.darkestGray),
          borderRadius: BorderRadius.circular(8),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.darkestGray),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: DecoratedInputBorder(
          child: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.yellow),
            borderRadius: BorderRadius.circular(8),
          ),
          shadow: BoxShadow(
            color: AppColors.yellow.withOpacity(0.2),
            spreadRadius: 3,
          ),
        ),
        errorStyle: const TextStyle(
          color: AppColors.red,
          decorationColor: AppColors.red,
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(
        foregroundColor: AppColors.white,
        backgroundColor: Colors.transparent,
        hoverColor: Colors.transparent,
        padding: const EdgeInsets.all(11),
        iconSize: 18,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ).copyWith(
        overlayColor: const MaterialStatePropertyAll(Colors.transparent),
        side: MaterialStateProperty.resolveWith<BorderSide?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            return const BorderSide(color: AppColors.white);
          }

          return const BorderSide(color: AppColors.darkestGray);
          ;
        }),
      )),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        shadowColor: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500,color: AppColors.white),
        disabledForegroundColor: AppColors.darkGray,
        foregroundColor: AppColors.white,
      ).copyWith(
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            return AppColors.pressedYellow;
          }if (states.contains(MaterialState.disabled)) {
            return AppColors.black;
          }

          return AppColors.yellow;
        }),
        overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            return AppColors.pressedYellow;
          }

          return AppColors.yellow;
        }),
      )),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
        backgroundColor: Colors.transparent,
        padding: (const EdgeInsets.symmetric(horizontal: 16, vertical: 16)),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        foregroundColor: AppColors.white,
      ).copyWith(
        overlayColor: const MaterialStatePropertyAll(Colors.transparent),
        side: MaterialStateProperty.resolveWith<BorderSide?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            return const BorderSide(color: AppColors.white);
          }

          return const BorderSide(color: AppColors.darkestGray);
          
        }),
      )),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
        foregroundColor: AppColors.yellow,
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        shadowColor: Colors.transparent,
      ).copyWith(
        overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            return AppColors.black;
          }

          return Colors.transparent;
        }),
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            return AppColors.black;
          }

          return Colors.transparent;
        }),
      )),
    );
  }
}
