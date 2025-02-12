import 'package:firebase_auth/firebase_auth.dart';
import 'package:weather/feature/auth/register/data/data_source/register_remote_data_source.dart';

import '../../domain/repos/register_repo.dart';

class RegisterRepoImpl implements RegisterRepo {
  RegisterRemoteDataSource registerRemoteDataSource;
  RegisterRepoImpl({required this.registerRemoteDataSource});
  @override
  Future<UserCredential?> register(String fullName, String email,
      String password, String confirmationPassword) async {
    var response = await registerRemoteDataSource.register(
      fullName,
      email,
      password,
      confirmationPassword,
    );
    return response;
  }
}
