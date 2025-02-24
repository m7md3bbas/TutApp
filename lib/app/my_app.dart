import 'package:flutter/material.dart';
import 'package:tutapp/presentation/res/route_manager.dart';
import 'package:tutapp/presentation/res/theme_manager.dart';
import 'package:tutapp/presentation/splash/splash_view.dart';

class MyApp extends StatefulWidget {
  const MyApp._internal();
  static final MyApp _instance = MyApp._internal();
  factory MyApp() => _instance;
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: RouteGen.getRoute,
      initialRoute: RouteManager.splashRoute,
      theme: getApplicationTheme(),
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}
