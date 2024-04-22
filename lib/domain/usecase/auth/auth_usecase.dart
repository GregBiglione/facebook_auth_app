import 'package:facebook_auth_app/domain/usecase/auth/facebook_login_usecase.dart';

class AuthUseCase {
  final FacebookLoginUseCase facebookLoginUseCase;

  AuthUseCase({required this.facebookLoginUseCase});
}