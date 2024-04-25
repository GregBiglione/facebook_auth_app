import 'package:facebook_auth_app/presentation/resource/color_manager.dart';
import 'package:facebook_auth_app/presentation/resource/font_manager.dart';
import 'package:facebook_auth_app/presentation/resource/string_manager.dart';
import 'package:facebook_auth_app/presentation/resource/style_manager.dart';
import 'package:facebook_auth_app/presentation/screen/home/widget/home_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gradient_app_bar/flutter_gradient_app_bar.dart';

import '../../../app/constant.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    return Scaffold(
      backgroundColor: ColorManager.black,
      appBar: GradientAppBar(
        automaticallyImplyLeading: false,
        gradient: LinearGradient(
          colors: [
            ColorManager.primary,
            ColorManager.primaryDark,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        title: Text(
          StringManager.homeTitle,
          style: getBoldStyle(
            fontSize: FontSize.s16,
            color: ColorManager.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              logger.i("Logout button clicked");
            },
            icon: Icon(
              Icons.logout,
              color: ColorManager.white,
            ),
          ),
        ],
      ),
      body: const HomeContent(),
    );
  }
}
