import 'package:facebook_auth_app/domain/repository/auth/auth_repository.dart';
import 'package:facebook_auth_app/domain/utils/state_render.dart';
import 'package:facebook_auth_app/presentation/resource/string_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class AuthRepositoryImplementer extends AuthRepository {
  final FirebaseAuth _firebaseAuth;

  AuthRepositoryImplementer(this._firebaseAuth);

  @override
  Future<StateRender> facebookLogin() async {
    try {
      final loginResult = await FacebookAuth.instance.login();
      final OAuthCredential credential = FacebookAuthProvider
          .credential(loginResult.accessToken!.token);

      final UserCredential userCredential = await _firebaseAuth
          .signInWithCredential(credential);

      return Success(userCredential.user);
    }
    on FirebaseAuthException catch (e) {
      return Error(e.message ?? StringManager.unknownError);
    }
  }

  @override
  User? get user => _firebaseAuth.currentUser;
}