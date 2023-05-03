import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groceryapp/views/pages/splash/splash_view.dart';
import 'package:groceryapp/views/themes/app_themes.dart';

void main() {
  // runApp(DevicePreview(
  //   enabled: !kReleaseMode,
  //   builder: (context) => const MyApp(),
  // ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
                  textScaleFactor: mqd.textScaleFactor >=  1.15 ? 1.15 : 1.0),
              child: child!,
            );
          },
          home: snapshot,
        );
      },
      child: const SplashView(),
    );
  }
}