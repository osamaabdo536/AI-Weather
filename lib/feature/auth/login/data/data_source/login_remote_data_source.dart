import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginRemoteDataSource{
  Future<UserCredential?> login(String email,String password);
}