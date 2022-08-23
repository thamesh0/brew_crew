import '/screens/authenticate/authenticate.dart';
import '/screens/home_screen/home_page.dart';
import 'package:provider/provider.dart';
import '/screens/loading_screen/loading.dart';
import 'package:flutter/material.dart';
import '/models/user.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);
    print(user);
    // Return either Home or Auth widget.
    if (user == null) {
      return const Auth();
    } else {
      return const HomePage();
    }
  }
}
