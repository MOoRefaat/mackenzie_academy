import 'package:flutter/material.dart';
import 'package:mackenzie_academy/core/utils/theme/color.dart';

ThemeData lightTheme() => ThemeData(
  scaffoldBackgroundColor: AppColors.white,
  appBarTheme: const AppBarTheme(
    titleSpacing: 20.0,
    backgroundColor: AppColors.white,
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: AppColors.blue20,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: AppColors.blue20,
    unselectedItemColor: AppColors.gray10,
    elevation: 20.0,
    backgroundColor: AppColors.green30,
  ),
  // textTheme: TextTheme(
  //   bodyLarge: GoogleFonts.poppins(
  //     fontSize: 19,
  //     fontWeight: FontWeight.w500,
  //     letterSpacing: 0.15,
  //     color: AppColors.blue20,
  //   ),
  // ),
  switchTheme: SwitchThemeData(
    thumbColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return AppColors.gray10;
      }
      if (states.contains(MaterialState.disabled)) {
        return Colors.white;
      }
      return AppColors.blue20;
    }),
    trackColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return AppColors.green30;
      }
      if (states.contains(MaterialState.disabled)) {
        return Colors.white;
      }
      return AppColors.gray10;
    }),
  ),
);