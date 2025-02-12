import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseUtils {
  FirebaseUtils._();

  static FirebaseUtils? _instance;

  static FirebaseUtils getInstance() {
    _instance ??= FirebaseUtils._();
    return _instance!;
  }

  static final auth = FirebaseAuth.instance;

  Future<UserCredential?> register(
    String fullName,
    String email,
    String password,
    String confirmationPassword,
  ) async {
    try {
      final userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('User registered successfully');

      if (userCredential.user != null) {
        await userCredential.user!.updateDisplayName(fullName);

        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .set({
          'username': fullName,
          'email': email,
          'password': password,
        });
      }

      return userCredential;
    }catch (e) {
      print('An error occurred: ${e.toString()}');
    }
    return null;
  }

  Future<UserCredential?> login(
    String email,
    String password,
  ) async {
    try {
      // Try to sign in the user
      final userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      print('User signed in successfully');
      return userCredential;
    } catch (e) {
      print('An error occurred: ${e.toString()}');
    }

    return null;
  }
}
