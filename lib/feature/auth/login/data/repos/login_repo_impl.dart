import 'package:firebase_auth/firebase_auth.dart';
import 'package:weather/feature/auth/login/data/data_source/login_remote_data_source.dart';
import 'package:weather/feature/auth/login/domain/repos/login_repo.dart';

class LoginRepoImpl implements LoginRepo{
  LoginRemoteDataSource loginRemoteDataSource;
  LoginRepoImpl({required this.loginRemoteDataSource});
  @override
  Future<UserCredential?> login(String email, String password) {
    var response = loginRemoteDataSource.login(email, password);
    return response;
  }
}