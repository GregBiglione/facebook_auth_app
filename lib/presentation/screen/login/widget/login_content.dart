import 'package:facebook_auth_app/presentation/resource/string_manager.dart';
import 'package:facebook_auth_app/presentation/resource/value_manager.dart';
import 'package:flutter/material.dart';

class LoginContent extends StatefulWidget {
  const LoginContent({super.key});

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

  Widget _getContentWidget() => Padding(
    padding: const EdgeInsets.only(
      left: ValueManager.v16,
      right: ValueManager.v16,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _loginTitleWidget(),
        const SizedBox(
          height: ValueManager.v20,
        )
      ],
    ),
  );

  //----------------------------------------------------------------------------
  // Title
  //----------------------------------------------------------------------------

  Widget _loginTitleWidget() => Padding(
    padding: const EdgeInsets.only(
      left: ValueManager.v16,
      right: ValueManager.v16,
    ),
    child: Text(
      StringManager.logInTitle,
      style: Theme.of(context).textTheme.displayMedium,
    )
  );
}
