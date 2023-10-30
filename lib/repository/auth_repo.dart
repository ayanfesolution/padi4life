import 'package:flutter/foundation.dart';
import 'package:padi4life/models/sign_up_details.dart';

import '../datasource/datasources.dart';
import '../models/user_details_model.dart';
import '../utils/helper.dart';

class AuthRepository {
  final AuthDataSource authDataSource;

  AuthRepository(this.authDataSource);

  Future<UserDataDetails?> signIn({
    required String email,
    required String password,
  }) async {
    final res = await authDataSource.signIn(
      email: email,
      password: password,
    );
    UserDataDetails result;
    if (res != null) {
      result = UserDataDetails.fromJson(res);

      if (kDebugMode) {
        print(result);
      }
      return result;
    } else {
      return null;
    }
  }

  Future<UserDataDetails?> verifyBvn(
      {required String pin,
      required String bvn,
      required String userName}) async {
    final res = await authDataSource.verifyBVN(
      pin: pin,
      bvn: bvn,
      userName: userName,
    );
    UserDataDetails result;
    if (res != null) {
      result = UserDataDetails.fromJson(res);

      if (kDebugMode) {
        print(result);
      }
      return result;
    } else {
      return null;
    }
  }

   Future<UserDataDetails?> createPadiWallet(
      {required String pin,
      required String bvn,
      required String userName}) async {
    final res = await authDataSource.createPadiWallet(
      pin: pin,
      bvn: bvn,
      userName: userName,
    );
    UserDataDetails result;
    if (res != null) {
      result = UserDataDetails.fromJson(res);

      if (kDebugMode) {
        print(result);
      }
      return result;
    } else {
      return null;
    }
  }
  

  Future<UserSignUpResponse?> signUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String userName,
    required String address,
  }) async {
    final res = await authDataSource.signUp(
      email: email,
      password: password,
      firstName: firstName,
      lastName: lastName,
      userName: userName,
      address: address,
    );

    UserSignUpResponse result;
    if (res != null) {
      result = UserSignUpResponse.fromJson(res);
      Helper.storeAString(
        key: ConstantKeys.kPassword,
        value: password,
      );
      Helper.storeAString(
        key: ConstantKeys.kEmail,
        value: email,
      );
      Helper.storeAString(
        key: ConstantKeys.kUsername,
        value: userName,
      );
      Helper.identifyAsFirstLaunch();
      if (kDebugMode) {
        print(result);
      }
      return result;
    } else {
      return null;
    }
  }
}
