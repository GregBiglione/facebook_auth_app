import 'package:facebook_auth_app/app/function.dart';
import 'package:facebook_auth_app/domain/utils/state_render.dart';
import 'package:facebook_auth_app/presentation/resource/color_manager.dart';
import 'package:facebook_auth_app/presentation/resource/string_manager.dart';
import 'package:facebook_auth_app/presentation/screen/loading/loading_screen.dart';
import 'package:facebook_auth_app/presentation/screen/login/login_view_model.dart';
import 'package:facebook_auth_app/presentation/screen/login/widget/login_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/constant.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginViewModel viewModel = Provider.of<LoginViewModel>(context);

    return Scaffold(
      backgroundColor: ColorManager.black,
      body: StreamBuilder(
        stream: viewModel.response,
        builder: (context, snapshot) {
          final response = snapshot.data;

          if(response is Success) {
            logger.i("Success ${response.data}");
            goToHomeScreen(context);
          }
          else if(response is Loading) {
            logger.w("Loading...");
            return const LoadingScreen();
          }
          else if(response is Error) {
            final data = response;
            String error = StringManager.error + data.error;

            errorToast(context, error);
          }

          return LoginContent(viewModel: viewModel,);
        },
      ),
    );
  }
}
