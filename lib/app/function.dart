import 'dart:async';

import 'package:facebook_auth_app/presentation/resource/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

import '../domain/utils/state_render.dart';
import '../presentation/resource/route_manager.dart';

// Error toast -----------------------------------------------------------------

void errorToast(BuildContext context, String message) => toastification.show(
  context: context,
  title: Text(message),
  autoCloseDuration: const Duration(seconds: 2),
  type: ToastificationType.error,
  style: ToastificationStyle.fillColored,
  showProgressBar: false,
  alignment: Alignment.bottomCenter,
  backgroundColor: ColorManager.error,
);

// Go to home screen -----------------------------------------------------------

void goToHomeScreen(BuildContext context) => WidgetsBinding.instance
    .addPostFrameCallback((timeStamp) {
      Navigator.pushReplacementNamed(
        context,
        Routes.homeRoute,
      );
});

void removeLoadingScreen(Timer? timer, int duration, 
    StreamController streamController) {
  timer = Timer(
    Duration(seconds: duration), 
    () => streamController.add(Init()),
  );
}