import 'package:firebase_auth/firebase_auth.dart';
import 'package:weather/core/network/firebase_utils.dart';
import 'package:weather/feature/auth/register/data/data_source/register_remote_data_source.dart';

class RegisterRemoteDataSourceImpl implements RegisterRemoteDataSource {
  FirebaseUtils firebaseUtils;
  RegisterRemoteDataSourceImpl({required this.firebaseUtils});
  @override
  Future<UserCredential?> register(String fullName, String email,
      String password, String confirmationPassword) async {
    var response = await firebaseUtils.register(
      fullName,
      email,
      password,
      confirmationPassword,
    );
    return response;
  }
}
