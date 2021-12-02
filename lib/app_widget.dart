import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'config_reader.dart';
import 'core/providers/providers.dart';
import 'ui/pages/constants/theme.dart';
import 'ui/pages/pages.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: TransactionProvider(),
        ),
        ChangeNotifierProvider.value(
          value: UserProvider(),
        ),
        ChangeNotifierProvider.value(
          value: ArticleProvider(),
        ),
        ChangeNotifierProvider.value(
          value: MapelProvider(),
        ),
        ChangeNotifierProvider.value(
          value: TeacherProvider(),
        ),
        ChangeNotifierProvider.value(
          value: RatingProvider(),
        ),
        ChangeNotifierProvider.value(
          value: ScheduleProvider(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: ConfigReader.getAppName(),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [const Locale('id', 'ID')],
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
        home: SplashPage(),
      ),
    );
  }
}
