import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class LoginRepo {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User> registerWithEmailPassword(String email, String password) async {
    User user;

    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      user = userCredential.user;

      if (user != null) {
        return user;
      }
    } catch (e) {
      print(e);
      throw (e);
    }
  }
}
