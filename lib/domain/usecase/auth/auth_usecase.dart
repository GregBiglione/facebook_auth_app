import 'package:facebook_auth_app/domain/usecase/auth/facebook_login_usecase.dart';
import 'package:facebook_auth_app/domain/usecase/auth/user_session_usecase.dart';

import 'logout_usecase.dart';

class AuthUseCase {
  final FacebookLoginUseCase facebookLoginUseCase;
  final UserSessionUseCase userSessionUseCase;
  final LogOutUseCase logOutUseCase;

  AuthUseCase({required this.facebookLoginUseCase, required this.userSessionUseCase,
    required this.logOutUseCase});
}