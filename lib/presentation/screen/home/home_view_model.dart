import 'package:facebook_auth_app/domain/model/user_data.dart';
import 'package:facebook_auth_app/domain/usecase/auth/auth_usecase.dart';
import 'package:flutter/material.dart';

import '../../../domain/usecase/user/user_usecase.dart';
import '../../../domain/utils/state_render.dart';

class HomeViewModel extends ChangeNotifier {
  // Use case ------------------------------------------------------------------
  final AuthUseCase _authUseCase;
  final UserUseCase _userUseCase;

  HomeViewModel(this._authUseCase, this._userUseCase);

  // ---------------------------------------------------------------------------
  // Logout
  // ---------------------------------------------------------------------------

  void logout() async {
    await _authUseCase.logOutUseCase.launch();
  }

  // ---------------------------------------------------------------------------
  // Get user
  // ---------------------------------------------------------------------------

  Stream<StateRender<UserData>> getUser() {
    String uid = _authUseCase.userSessionUseCase.userSession!.uid;

    return _userUseCase.getUserUseCase.launch(uid);
  }
}