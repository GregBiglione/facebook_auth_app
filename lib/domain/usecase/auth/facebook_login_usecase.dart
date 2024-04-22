import 'package:facebook_auth_app/domain/repository/auth/auth_repository.dart';

class FacebookLoginUseCase {
  final AuthRepository _repository;

  FacebookLoginUseCase(this._repository);

  launch() => _repository.facebookLogin();
}