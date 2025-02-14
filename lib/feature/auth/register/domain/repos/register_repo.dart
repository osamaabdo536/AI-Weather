import 'package:firebase_auth/firebase_auth.dart';

abstract class RegisterRepo {
  Future<UserCredential?> register(
    String fullName,
    String email,
    String password,
    String confirmationPassword,
  );
}
