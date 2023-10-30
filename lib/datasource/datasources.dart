import 'package:fluttertoast/fluttertoast.dart';

import '../api/api_client.dart';
import '../utils/constants.dart';
import '../utils/error_handling.dart';
import 'endpionts.dart';

class AuthDataSource {
  AuthDataSource(this.client);
  final ApiClient client;

  Future<dynamic> signUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String userName,
    required String address,
  }) async {
    final data = {
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "username": userName,
      "address": address,
      "password": password
    };
    try {
      client.header = {'Accept': '*/*'};
      final result = await client.post(
        Endpoints.signUp,
        data: data,
      );
      final output = result.data;
      // print(output);
      return output;
    } catch (e) {
      kToastMsgPopUp(
        NetworkExceptions.getDioException(e),
        ToastGravity.CENTER,
      );
      // rethrow;
    }
  }

  Future<dynamic> signIn({
    required String email,
    required String password,
  }) async {
    final data = {"email_or_username": email, "password": password};
    try {
      client.header = {'Accept': '*/*'};
      final result = await client.post(
        Endpoints.signIn,
        data: data,
      );
      final output = result.data;
      // print(output);
      return output;
    } catch (e) {
      kToastMsgPopUp(
        NetworkExceptions.getDioException(e),
        ToastGravity.CENTER,
      );
      // rethrow;
    }
  }

  Future<dynamic> verifyBVN(
      {required String pin,
      required String bvn,
      required String userName}) async {
    final data = {
      "balance": 1000.00,
      "pin": int.tryParse(pin) ?? 1234,
      "bvn": bvn
    };

    try {
      client.header = {'Accept': '*/*'};
      final result = await client.post(
        '$userName/${Endpoints.bvn}',
        data: data,
      );
      final output = result.data;
      // print(output);
      return output;
    } catch (e) {
      // kToastMsgPopUp(
      //   NetworkExceptions.getDioException(e),
      //   ToastGravity.CENTER,
      // );
      // rethrow;
    }
  }

  Future<dynamic> createPadiWallet(
      {required String pin,
      required String bvn,
      required String userName}) async {
    final data = {"balance": 1000, "pin": pin};

    try {
      client.header = {'Accept': '*/*'};
      final result = await client.post(
        '$userName/${Endpoints.padiWallet}',
        data: data,
      );
      final output = result.data;
      // print(output);
      return output;
    } catch (e) {
      // kToastMsgPopUp(
      //   NetworkExceptions.getDioException(e),
      //   ToastGravity.CENTER,
      // );
      // rethrow;
    }
  }
}
