import '../../repository/auth/auth_repository.dart';

class LogOutUseCase {
  final AuthRepository _repository;

  LogOutUseCase(this._repository);

  launch() => _repository.logout();
}