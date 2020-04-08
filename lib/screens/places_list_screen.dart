import 'package:flutter/material.dart';
import 'package:flutter_great_places_app/screens/add_place_screen.dart';

class PlacessListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add), 
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            }),
        ],
      ),
      body: Center(child: CircularProgressIndicator()),
    );
  }
}