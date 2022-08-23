import 'package:brew_crew/screens/authenticate/sign_in.dart';
import 'package:brew_crew/screens/authenticate/sign_up.dart';
import 'package:flutter/material.dart';

class Auth extends StatefulWidget {
  const Auth({Key? key}) : super(key: key);
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  late bool showSignIn;
  void toggleView() => setState(() {
        showSignIn = !showSignIn;
      });
  @override
  void initState() {
    showSignIn = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignIn();
    } else {
      return SignUp();
    }
  }
}
