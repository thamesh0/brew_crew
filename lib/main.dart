import '/models/user.dart';
import '/screens/authenticate/sign_in.dart';
import '/screens/authenticate/sign_up.dart';
import '/screens/loading_screen/loading.dart';
import '/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/home_screen/home_page.dart';
import 'screens/authenticate/authenticate.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return StreamProvider<MyUser?>.value(
      initialData: null,
      value: AuthService().userStream,
      child: MaterialApp(
        routes: {
          '/': (context) => const SplashScreen(),
          '/home_page': (context) => const HomePage(),
          '/authenticate': (context) => const Auth(),
          '/login': (context) => const SignIn(),
          '/signup': (context) => const SignUp(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
