import 'package:facebook_auth_app/domain/usecase/auth/facebook_login_usecase.dart';
import 'package:facebook_auth_app/domain/usecase/auth/user_session_usecase.dart';

class AuthUseCase {
  final FacebookLoginUseCase facebookLoginUseCase;
  final UserSessionUseCase userSessionUseCase;

  AuthUseCase({required this.facebookLoginUseCase, required this.userSessionUseCase});
}