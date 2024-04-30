import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facebook_auth_app/app/app_preferences.dart';
import 'package:facebook_auth_app/app/constant.dart';
import 'package:facebook_auth_app/app/di/injection.dart';
import 'package:facebook_auth_app/domain/model/user_data.dart';
import 'package:facebook_auth_app/domain/repository/auth/auth_repository.dart';
import 'package:facebook_auth_app/domain/utils/state_render.dart';
import 'package:facebook_auth_app/presentation/resource/string_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:injectable/injectable.dart';

final AppPreferences _appPreferences = getIt<AppPreferences>();

class AuthRepositoryImplementer extends AuthRepository {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;
  final CollectionReference _usersCollection;

  AuthRepositoryImplementer(this._firebaseAuth, this._firebaseFirestore,
      @Named(USER) this._usersCollection);

  @override
  Future<StateRender> facebookLogin() async {
    try {
      final loginResult = await FacebookAuth.instance.login();
      final OAuthCredential credential = FacebookAuthProvider
          .credential(loginResult.accessToken!.token);

      final UserCredential userCredential = await _firebaseAuth
          .signInWithCredential(credential);
      _appPreferences.setUserLogged();

      FacebookAuth.instance.getUserData().then(
              (value) {
                String photo = value["picture"]["data"]["url"];
                logger.e(photo);
              }
      );

      // Firestore -------------------------------------------------------------

      final DocumentSnapshot ds = await _firebaseFirestore
          .collection(USER)
          .doc(user?.uid)
          .get();

      if(!ds.exists) {
        UserData userData = UserData(
          uid: user!.uid,
          name: user!.displayName!,
          team: "49ers",
          position: "WR",
          number: "#81",
        );

        await _usersCollection
            .doc(userData.uid)
            .set(userData.toJson());
      }

      return Success(userCredential.user);
    }
    on FirebaseAuthException catch (e) {
      return Error(e.message ?? StringManager.unknownError);
    }
  }

  @override
  User? get user => _firebaseAuth.currentUser;

  @override
  Future<void> logout() async {
    _appPreferences.logout();
    _firebaseAuth.signOut();
  }
}