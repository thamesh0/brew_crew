import 'screens/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/home_screen/home_page.dart';
import 'screens/authenticate/authenticate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return MaterialApp(
      routes: {
        '/': (context) => const Wrapper(),
        '/home_page': (context) => const HomePage(),
        '/authenticate': (context) => const Auth(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
