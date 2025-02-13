import 'package:flutter/material.dart';
import 'package:tutapp/presentation/forgetpassword/forgetpassword_view.dart';
import 'package:tutapp/presentation/login/login_view.dart';
import 'package:tutapp/presentation/main/main_view.dart';
import 'package:tutapp/presentation/register/register_view.dart';
import 'package:tutapp/presentation/res/strings_manager.dart';
import 'package:tutapp/presentation/splash/splash_view.dart';
import 'package:tutapp/presentation/store/store_view.dart';

class RouteManager {
  static const String splashRoute = '/';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String forgetPasswordRoute = '/forgetpassword';
  static const String mainRoute = '/main';
  static const String storeDetailsRoute = '/storedetails';
}

class RouteGen {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteManager.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case RouteManager.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case RouteManager.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case RouteManager.forgetPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgetpasswordView());
      case RouteManager.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainView());
      case RouteManager.storeDetailsRoute:
        return MaterialPageRoute(builder: (_) => const StoreView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(StringsManager.noRouteFound),
              ),
              body: Center(child: Text(StringsManager.noRouteFound)),
            ));
  }
}
