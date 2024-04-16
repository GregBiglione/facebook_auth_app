import 'package:facebook_auth_app/presentation/resource/color_manager.dart';
import 'package:facebook_auth_app/presentation/screen/login/widget/login_content.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.black,
      body: const LoginContent(),
    );
  }
}
