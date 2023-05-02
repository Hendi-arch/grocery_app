import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groceryapp/views/themes/app_colors.dart';

class AppThemes {
  static ThemeData data() {
    return ThemeData(
      fontFamily: 'Poppins',
      primarySwatch: Colors.green,
      scaffoldBackgroundColor: kScaffoldBackgroundColor,
      textTheme: TextTheme(
        displayLarge: TextStyle(fontSize: 57.sp),
        displayMedium: TextStyle(fontSize: 45.sp),
        displaySmall: TextStyle(fontSize: 36.sp),
        headlineLarge: TextStyle(fontSize: 32.sp),
        headlineMedium: TextStyle(fontSize: 28.sp),
        headlineSmall: TextStyle(fontSize: 24.sp, color: kTextBoldColor),
        titleLarge: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w500),
        titleMedium: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
        titleSmall: TextStyle(
            fontSize: 14.sp, fontWeight: FontWeight.w500, color: kTextColor),
        labelLarge: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
        labelMedium: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
        labelSmall: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w500),
        bodyLarge: TextStyle(fontSize: 16.sp),
        bodyMedium: TextStyle(fontSize: 14.sp),
        bodySmall: TextStyle(fontSize: 12.sp),
      ),
    );
  }
}
