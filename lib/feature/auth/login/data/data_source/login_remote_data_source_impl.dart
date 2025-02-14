import 'package:firebase_auth/firebase_auth.dart';
import 'package:weather/core/network/firebase_utils.dart';

import 'login_remote_data_source.dart';

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource{
  FirebaseUtils firebaseUtils;
  LoginRemoteDataSourceImpl({required this.firebaseUtils});
  @override
  Future<UserCredential?> login(String email, String password) {
    var response = firebaseUtils.login(email, password);
    return response;
  }
}