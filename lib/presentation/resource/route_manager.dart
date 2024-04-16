import 'package:facebook_auth_app/presentation/resource/color_manager.dart';
import 'package:facebook_auth_app/presentation/resource/string_manager.dart';
import 'package:facebook_auth_app/presentation/screen/login/login_screen.dart';
import 'package:facebook_auth_app/presentation/screen/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch(routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case Routes.loginRoute:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text(
            StringManager.noRouteFound,
            style: Theme.of(_).textTheme.displaySmall,
          ),
        ),
        backgroundColor: ColorManager.black,
        body: Center(
          child: Text(
            StringManager.noRouteFound,
            style: Theme.of(_).textTheme.displaySmall,
          ),
        ),
      ),
    );
  }
}