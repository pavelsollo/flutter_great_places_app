import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/add_place_screen.dart';
import 'package:path_provider/path_provider.dart';
import '../providers/great_places.dart';

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
      body: Consumer<GreatPlaces>(
        child: Center(child: Text('Got on Place, please add one')),
        builder: (ctx, greatPlases, ch) => greatPlases.items.length <= 0 
          ? ch 
          : ListView.builder(
              itemCount: greatPlases.items.length,
              itemBuilder: (ctx, i) => ListTile(
                leading: CircleAvatar(backgroundImage: FileImage(greatPlases.items[i].image),),
                title: Text(greatPlases.items[i].title),
                onTap: () {},
              ),
            )
        ),
      );
  }
}