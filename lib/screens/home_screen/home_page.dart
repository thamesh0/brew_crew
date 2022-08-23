import 'package:brew_crew/screens/settings/settings_form.dart';
import 'package:brew_crew/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '/services/database_service.dart';
import '/utilities/brew_list.dart';
import '/models/brew.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthService _auth = AuthService();

  void showSettingsPanel() {
    showModalBottomSheet(context: context, builder: (context) => Container(
      padding: const EdgeInsets.all(20.0),
      child: const SettingsForm(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Brew>?>.value(
      initialData: null,
      value: DatabaseService().brews,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: const Text("Brew Crew"),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: [
            TextButton.icon(
              onPressed: () async {
                await _auth.signOut();
                Navigator.pushReplacementNamed(context, '/login');
              },
              icon: const Icon(Icons.person),
              label: const Text("Sign out"),
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.black)),
            ),
            TextButton.icon(
              onPressed: () => showSettingsPanel(),
              icon: const Icon(Icons.settings),
              label: const Text("Settings"),
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.black)),
            )
          ],
        ),
        body: const BrewList(),
      ),
    );
  }
}
