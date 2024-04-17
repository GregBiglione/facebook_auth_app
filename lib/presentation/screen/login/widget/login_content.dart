import 'package:facebook_auth_app/presentation/resource/color_manager.dart';
import 'package:facebook_auth_app/presentation/resource/font_manager.dart';
import 'package:facebook_auth_app/presentation/resource/string_manager.dart';
import 'package:facebook_auth_app/presentation/resource/style_manager.dart';
import 'package:facebook_auth_app/presentation/resource/value_manager.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../app/constant.dart';

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
        ),
        _facebookButtonWidget(),
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

  //----------------------------------------------------------------------------
  // Facebook button
  //----------------------------------------------------------------------------

  Widget _facebookButtonWidget() => GestureDetector(
    child: Padding(
        padding: const EdgeInsets.only(
          left: ValueManager.v16,
          right: ValueManager.v16,
        ),
        child: Container(
          width: ValueManager.infinity,
          height: ValueManager.v50,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                ColorManager.primary,
                ColorManager.primaryDark,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(
                ValueManager.v30,
              ),
            ),
          ),
          child: Row(
            children: [
              const SizedBox(
                width: ValueManager.v20,
              ),
              // Logo ------------------------------------------------------------
              FaIcon(
                FontAwesomeIcons.facebook,
                color: ColorManager.white,
                size: ValueManager.v30,
              ),
              // Title -----------------------------------------------------------
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: ValueManager.v50,
                  ),
                  child: Text(
                    StringManager.facebookButtonTitle,
                    style: getBoldStyle(
                      fontSize: FontSize.s18,
                      color: ColorManager.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
    ),
    onTap: () {
      logger.i("Facebook button clicked");
    },
  );
}
