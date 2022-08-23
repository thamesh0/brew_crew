import 'package:brew_crew/models/brew.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'brew_tile.dart';

class BrewList extends StatefulWidget {
  const BrewList({Key? key}) : super(key: key);

  @override
  _BrewListState createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<Brew>?>(context);

    return ListView.builder(
        itemCount: brews!.length,
        itemBuilder: (context,i) => BrewTile(brews[i]));
  }
}
