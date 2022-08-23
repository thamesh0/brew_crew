import 'package:brew_crew/models/user.dart';
import 'package:brew_crew/services/database_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({Key? key}) : super(key: key);

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formkey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];

  // Form values
  String? _currentName;
  String? _currentSugars;
  int? _currentStrength;

  @override
  Widget build(BuildContext context) {
    final MyUser? userData = Provider.of<MyUser?>(context);
    List<Widget> children() => [
          _buildFormField('Name'),
          _buildDropdownMenu(userData!),
          _buildSlider(userData),
          updateButton(userData),
        ];
    return StreamProvider<MyUser?>.value(
      initialData: null,
      value: DatabaseService().userData,
      child: Form(
        key: _formkey,
        child: ListView.separated(
            itemBuilder: (context, i) => children()[i],
            separatorBuilder: (context, i) => const SizedBox(height: 20.0),
            itemCount: children().length),
      ),
    );
  }

  Widget _buildSlider(MyUser userData) {
    return Slider(
      onChanged: (val) {
        setState(() => _currentStrength = val.toInt());
      },
      min: 100,
      max: 900,
      divisions: 8,
      activeColor: Colors.brown[_currentStrength ?? userData.strength!],
      inactiveColor: Colors.brown[_currentStrength ?? userData.strength!],
      value: (_currentStrength ?? userData.strength!).toDouble(),
    );
  }

  Widget _buildDropdownMenu(MyUser userData) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: DropdownButtonFormField(
          value: _currentSugars ?? userData.sugars,
          items: sugars
              .map((sugar) =>
                  DropdownMenuItem(value: sugar, child: Text("$sugar sugars")))
              .toList(),
          onChanged: (val) => setState(() => _currentSugars = val as String?)),
    );
  }

  Widget _buildFormField(String hintText) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        onChanged: (val) => setState(() {
          if (val.isNotEmpty) {
            _currentName = val;
          }
        }),
        decoration: InputDecoration(
          hintText: hintText,
        ),
      ),
    );
  }

  Widget updateButton(MyUser userData) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 140.0),
      child: ElevatedButton(
        onPressed: () {
          _currentName ??= userData.name;
          _currentSugars ??= userData.sugars;
          _currentStrength ??= userData.strength;

          DatabaseService(uid: userData.uid).updateUserData(
              _currentSugars!, _currentName!, _currentStrength!);
          print(_currentName);
          print(_currentSugars);
          print(_currentStrength);
        },
        child: const Text(
          "Update",
          style: TextStyle(color: Colors.white),
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.pink)),
      ),
    );
  }
}
