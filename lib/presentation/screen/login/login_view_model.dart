import 'dart:async';

import 'package:facebook_auth_app/domain/usecase/auth/auth_usecase.dart';
import 'package:flutter/material.dart';

import '../../../domain/utils/state_render.dart';

class LoginViewModel extends ChangeNotifier {
  // Use case ------------------------------------------------------------------
  final AuthUseCase _authUseCase;
  final StreamController<StateRender> _responseController = StreamController();

  LoginViewModel(this._authUseCase);

  // Getters -------------------------------------------------------------------
  Stream<StateRender> get response => _responseController.stream;

  // ---------------------------------------------------------------------------
  // Facebook login
  // ---------------------------------------------------------------------------

  void facebookLogin() async {
    _responseController.add(Init());
    // Loading -----------------------------------------------------------------
    _responseController.add(Loading());
    // Login -------------------------------------------------------------------
    final data = await _authUseCase.facebookLoginUseCase.launch();
    _responseController.add(data);
  }
}