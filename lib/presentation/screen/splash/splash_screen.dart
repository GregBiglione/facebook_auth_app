import 'dart:async';

import 'package:facebook_auth_app/presentation/resource/color_manager.dart';
import 'package:facebook_auth_app/presentation/resource/string_manager.dart';
import 'package:facebook_auth_app/presentation/resource/style_manager.dart';
import 'package:facebook_auth_app/presentation/resource/value_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../resource/route_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  //----------------------------------------------------------------------------
  // Go to Login Screen
  //----------------------------------------------------------------------------

  _goToLoginScreen() {
    Navigator.pushReplacementNamed(
      context,
      Routes.loginRoute,
    );
  }

  //----------------------------------------------------------------------------
  // Start timer
  //----------------------------------------------------------------------------

  _startTimer() {
    _timer = Timer(
      const Duration(seconds: 4),
      _goToLoginScreen,
    );
  }

  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    return Scaffold(
      body: Container(
        width: ValueManager.infinity,
        height: ValueManager.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              ColorManager.primary,
              ColorManager.primaryDark,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image -----------------------------------------------------------
              FaIcon(
                FontAwesomeIcons.facebook,
                color: ColorManager.white,
                size: ValueManager.v80,
              ),
              const SizedBox(
                height: ValueManager.v20,
              ),
              // Title -----------------------------------------------------------
              Text(
                StringManager.appName,
                style: getBoldStyle(
                  fontSize: ValueManager.v20,
                  color: ColorManager.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
