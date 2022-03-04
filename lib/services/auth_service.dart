import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // Todo:

  // Sign-in Anonymously
  // Sign-in email & password
  // Register with email & password

  final FirebaseAuth _auth = FirebaseAuth.instance;
  AuthService();
  Future signInAnon() async {
    try {
      UserCredential res  = await _auth.signInAnonymously();
      User user = res.user!;
      return user;
    } catch (exp) {

      print(exp.toString());
      return null;
    }
  }
}
