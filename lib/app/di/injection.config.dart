// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i5;
import 'package:facebook_auth_app/app/di/app_module.dart' as _i11;
import 'package:facebook_auth_app/app/di/firebase_service.dart' as _i8;
import 'package:facebook_auth_app/domain/repository/auth/auth_repository.dart'
    as _i3;
import 'package:facebook_auth_app/domain/repository/user/user_repository.dart'
    as _i9;
import 'package:facebook_auth_app/domain/usecase/auth/auth_usecase.dart' as _i4;
import 'package:facebook_auth_app/domain/usecase/user/user_usecase.dart'
    as _i10;
import 'package:firebase_auth/firebase_auth.dart' as _i7;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.factory<_i3.AuthRepository>(() => appModule.authRepository);
    gh.factory<_i4.AuthUseCase>(() => appModule.authUseCase);
    gh.factory<_i5.CollectionReference<Object?>>(
      () => appModule.usersCollection,
      instanceName: 'users',
    );
    gh.factory<_i6.FacebookAuth>(() => appModule.facebookAuth);
    gh.factory<_i7.FirebaseAuth>(() => appModule.firebaseAuth);
    gh.factory<_i5.FirebaseFirestore>(() => appModule.firebaseFirestore);
    await gh.factoryAsync<_i8.FirebaseService>(
      () => appModule.firebaseService,
      preResolve: true,
    );
    gh.factory<_i9.UserRepository>(() => appModule.userRepository);
    gh.factory<_i10.UserUseCase>(() => appModule.userUseCase);
    return this;
  }
}

class _$AppModule extends _i11.AppModule {}
