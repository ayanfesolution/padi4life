import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:padi4life/utils/helper.dart';

import '../repository/auth_repo.dart';
import '../models/user_details_model.dart';
import '../utils/module.dart';

final authProvider = StateNotifierProvider<AuthProvider, UserDataDetails>(
    (ref) => AuthProvider());

class AuthProvider extends StateNotifier<UserDataDetails> {
  AuthProvider() : super(UserDataDetails());

  final authRepository = getIt.get<AuthRepository>();

  Future<bool> signInAccount({
    required String email,
    required String password,
  }) async {
    final response = await authRepository.signIn(
      email: email,
      password: password,
    );
    if (response != null) {
      Helper.storeAString(
        key: ConstantKeys.kEmail,
        value: email,
      );
      Helper.storeAString(
        key: ConstantKeys.kPassword,
        value: password,
      );
      Helper.identifyAsFirstLaunch();
      Helper.storeAString(
        key: ConstantKeys.kUsername,
        value: response.username ?? '',
      );
      state = response;
      return true;
    } else {
      return false;
    }
  }

  Future<bool> signUpAccount({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String userName,
    required String address,
  }) async {
    final response = await authRepository.signUp(
      email: email,
      password: password,
      firstName: firstName,
      lastName: lastName,
      userName: userName,
      address: address,
    );
    if (response != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> createWallet(
      {required String pin,
      required String bvn,
      required String userName}) async {
    final response = await authRepository.verifyBvn(
      pin: pin,
      bvn: bvn,
      userName: userName,
    );
    final responseTwo = await authRepository.createPadiWallet(
      pin: pin,
      bvn: bvn,
      userName: userName,
    );
    if (response != null && responseTwo != null) {
      return true;
    } else {
      return false;
    }
  }
}
