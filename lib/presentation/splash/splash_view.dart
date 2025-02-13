import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tutapp/presentation/res/assets_manager.dart';
import 'package:tutapp/presentation/res/color_manager.dart';
import 'package:tutapp/presentation/res/constant_manager.dart';
import 'package:tutapp/presentation/res/route_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? timer;
  void _splashViewTimer() {
    timer = Timer(Duration(seconds: ConstantManager.splashDelay), _goNext);
  }

  void _goNext() {
    Navigator.pushReplacementNamed(context, RouteManager.onBoarding);
  }

  @override
  void initState() {
    super.initState();
    _splashViewTimer();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryColor,
      body: Center(child: Image.asset(Imagemanager.splashLogo)),
    );
  }
}
