import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:groceryapp/shared/constants.dart';
import 'package:groceryapp/shared/test_utility.dart';
import 'package:groceryapp/views/pages/splash/splash_view.dart';

void main() {
  testWidgets('Splash view test ...', (tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      TestUtility().rootWidget(child: const SplashView()),
    );

    final tabBarViewFinder = find.byType(TabBarView);
    final tabBarViewController =
        tester.widget<TabBarView>(tabBarViewFinder).controller;

    // should return 0 when initially rendered
    expect(tabBarViewController?.index, 0);

    // should show 'Next' caption when initially rendered
    expect(find.text(kNext), findsOneWidget);

    // Tap the 'Next' button 2 times and trigger a frame.
    for (var i = 0; i < 2; i++) {
      await tester.tap(find.text(kNext));
      await tester.pump();
    }

    // should return 2 when 'Next' button tapped 2 times
    expect(tabBarViewController?.index, 2);

    // should show 'Get started' caption when user taps on button 2 times
    expect(find.text(kGetStarted), findsOneWidget);

    // Swipe back to the previous page
    tabBarViewController?.animateTo(1);
    await tester.pump();

    // should return 1 when user swipes back one time
    expect(tabBarViewController?.index, 1);

    // should show 'Next' caption when user swipes back one time
    expect(find.text(kNext), findsOneWidget);
  });
}
