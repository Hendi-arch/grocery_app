import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groceryapp/views/themes/app_themes.dart';

@visibleForTesting
class TestUtility {
  static final TestUtility _testUtilityInstance = TestUtility._();

  factory TestUtility() {
    return _testUtilityInstance;
  }

  TestUtility._();

  Widget rootWidget({required Widget child}) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      designSize: const Size(414, 896),
      builder: (context, snapshot) {
        return MaterialApp(
          title: 'Grocery',
          theme: AppThemes.data(),
          useInheritedMediaQuery: true,
          builder: (context, child) {
            final MediaQueryData mqd = MediaQuery.of(context);
            return MediaQuery(
              /// Setting font does not change with system font size
              data: MediaQuery.of(context).copyWith(
                  textScaleFactor: mqd.textScaleFactor >= 1.15 ? 1.15 : 1.0),
              child: child!,
            );
          },
          home: snapshot,
        );
      },
      child: child,
    );
  }
}
