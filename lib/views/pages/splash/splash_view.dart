import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groceryapp/shared/constants.dart';
import 'package:groceryapp/views/pages/splash/widgets/background_splash_widget.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  ValueNotifier<String> rightButtonCaption = ValueNotifier(kNext);

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_tabBarListener);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.removeListener(_tabBarListener);
    _tabController.dispose();
    super.dispose();
  }

  void _tabBarListener() {
    if (_isMoveForward()) {
      rightButtonCaption.value = kNext;
    } else {
      rightButtonCaption.value = kGetStarted;
    }
  }

  void _move() {
    int newIndex = _tabController.index;

    if (_isMoveForward()) {
      newIndex++;
    } else {
      // TODO: Return to auth or home page
    }

    _tabController.animateTo(newIndex);
  }

  bool _isMoveForward() => _tabController.index < _tabController.length - 1;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Theme.of(context).cardColor,
        body: Stack(
          children: [
            TabBarView(
              controller: _tabController,
              children: const [
                BackgroundSplashWidget(
                  image: kSplash1,
                  title: "Buy Grocery",
                  subtitle:
                      "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy",
                ),
                BackgroundSplashWidget(
                  image: kSplash2,
                  title: "Fast Delivery",
                  subtitle:
                      "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy",
                ),
                BackgroundSplashWidget(
                  image: kSplash3,
                  title: "Enjoy Quality Food",
                  subtitle:
                      "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy",
                ),
              ],
            ),
            Positioned(
              left: 36.w,
              bottom: 75.h,
              width: 342.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text("Skip", style: theme.textTheme.titleSmall),
                  ),
                  TabPageSelector(
                    controller: _tabController,
                    indicatorSize: 8.r,
                  ),
                  TextButton(
                    onPressed: _move,
                    child: ValueListenableBuilder<String>(
                      valueListenable: rightButtonCaption,
                      builder: (context, caption, child) {
                        return Text(
                          caption,
                          style: theme.textTheme.titleSmall?.copyWith(
                            color: theme.colorScheme.primary,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
