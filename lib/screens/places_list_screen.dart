import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './add_place_screen.dart';
import '../providers/great_places.dart';
import './place_detail_screen.dart';

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
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context, listen: false).fetchAndSetPlaces() ,
        builder: (ctx, snapshot) => snapshot.connectionState == ConnectionState.waiting 
        ? Center(child: CircularProgressIndicator())
        : Consumer<GreatPlaces>(
          child: Center(child: const Text('Got on Place, please add one')),
          builder: (ctx, greatPlases, ch) => greatPlases.items.length <= 0 
            ? ch 
            : ListView.builder(
                itemCount: greatPlases.items.length,
                itemBuilder: (ctx, i) => ListTile(
                  leading: CircleAvatar(backgroundImage: FileImage(greatPlases.items[i].image),),
                  title: Text(greatPlases.items[i].title),
                  subtitle: Text('greatPlases.items[i].location.address'),
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      PlaceDetailScreen.routeName,
                      arguments: greatPlases.items[i].id);
                  },
                ),
              )
          ),
      ),
      );
  }
}