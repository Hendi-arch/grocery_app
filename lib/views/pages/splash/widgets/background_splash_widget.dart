import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groceryapp/shared/functions.dart';
import 'package:groceryapp/shared/widget_spacer.dart';
import 'package:groceryapp/views/components/image_component.dart';

class BackgroundSplashWidget extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;

  const BackgroundSplashWidget({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      children: [
        Center(
          child: SizedBox(
            width: 384.w,
            height: 384.w,
            child: ImageComponent.asset(image: imageAsset(image)),
          ),
        ),
        Positioned(
          left: 47.w,
          width: 320.w,
          bottom: 145.h,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: theme.textTheme.headlineSmall
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              twelve,
              Text(
                subtitle,
                style: theme.textTheme.titleSmall,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        )
      ],
    );
  }
}
