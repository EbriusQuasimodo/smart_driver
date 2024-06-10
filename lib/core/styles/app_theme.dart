import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      appBarTheme: AppBarTheme(
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
            TextStyle(color: AppColors.darkGray, fontWeight: FontWeight.w400),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.darkestGray),
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: DecoratedInputBorder(
          child: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.red),
            borderRadius: BorderRadius.circular(8),
          ),
          shadow: BoxShadow(
            color: AppColors.red.withOpacity(0.2),
            spreadRadius: 2,
          ),
        ),
        focusedErrorBorder: DecoratedInputBorder(
          child: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.red),
            borderRadius: BorderRadius.circular(8),
          ),
          shadow: BoxShadow(
            color: AppColors.red.withOpacity(0.2),
            spreadRadius: 2,
          ),
        ),
        outlineBorder: BorderSide(color: AppColors.darkestGray),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.darkestGray),
          borderRadius: BorderRadius.circular(8),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.darkestGray),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: DecoratedInputBorder(
          child: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.yellow),
            borderRadius: BorderRadius.circular(8),
          ),
          shadow: BoxShadow(
            color: AppColors.yellow.withOpacity(0.2),
            spreadRadius: 3,
          ),
        ),
        errorStyle: TextStyle(
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
        overlayColor: MaterialStatePropertyAll(Colors.transparent),
        side: MaterialStateProperty.resolveWith<BorderSide?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            return BorderSide(color: AppColors.white);
          }

          return BorderSide(color: AppColors.darkestGray);
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
        textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        foregroundColor: AppColors.white,
      ).copyWith(
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            return AppColors.pressedYellow;
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
        textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        foregroundColor: AppColors.white,
      ).copyWith(
        overlayColor: MaterialStatePropertyAll(Colors.transparent),
        side: MaterialStateProperty.resolveWith<BorderSide?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            return BorderSide(color: AppColors.white);
          }

          return BorderSide(color: AppColors.darkestGray);
          ;
        }),
      )),
    );
  }
}
