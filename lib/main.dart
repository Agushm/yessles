import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ui/pages/constants/theme.dart';
import 'ui/pages/pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Yessles',
      theme: ThemeData.from(
        colorScheme: ColorScheme.light(
          primary: ColorBase.primary,
          //secondary: greenColor,
        ),
      ).copyWith(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
          },
        ),
      ),
      home: LoginPage(),
    );
  }
}
