import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facebook_auth_app/domain/model/user_data.dart';
import 'package:facebook_auth_app/domain/repository/user/user_repository.dart';
import 'package:facebook_auth_app/domain/utils/state_render.dart';
import 'package:facebook_auth_app/presentation/resource/string_manager.dart';
import 'package:injectable/injectable.dart';

import '../../../app/constant.dart';

class UserRepositoryImplementer implements UserRepository {
  final CollectionReference _userReference;

  UserRepositoryImplementer(@Named(USER) this._userReference);

  @override
  Stream<StateRender<UserData>> getUser(String uid) {
    try {
      final data = _userReference
          .doc(uid)
          .snapshots(includeMetadataChanges: true);

      final dataMap = data.map(
              (document) => Success(
                UserData.fromJson(document.data() as Map<String, dynamic>)
              ),
      );

      return dataMap;
    }
    on FirebaseException catch (e) {
      throw Error(e.message ?? StringManager.unknownError);
    }
  }

}