import 'package:facebook_auth_app/presentation/resource/string_manager.dart';
import 'package:facebook_auth_app/presentation/resource/value_manager.dart';
import 'package:facebook_auth_app/presentation/screen/login/login_view_model.dart';
import 'package:facebook_auth_app/presentation/widget/facebook_button_widget.dart';
import 'package:facebook_auth_app/presentation/widget/padding_widget.dart';
import 'package:facebook_auth_app/presentation/widget/title_widget.dart';
import 'package:flutter/material.dart';

class LoginContent extends StatefulWidget {
  final LoginViewModel viewModel;

  const LoginContent({super.key, required this.viewModel});

  @override
  State<LoginContent> createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent> {
  @override
  Widget build(BuildContext context) {
    return _getContentWidget();
  }

  //----------------------------------------------------------------------------
  // All content
  //----------------------------------------------------------------------------

  Widget _getContentWidget() => PaddingWidget(
    widget: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const TitleWidget(
          title: StringManager.logInTitle,
        ),
        const SizedBox(
          height: ValueManager.v20,
        ),
        FacebookButtonWidget(
          onPressed: () {
            widget.viewModel.facebookLogin();
          },
        ),
      ],
    ),
  );
}