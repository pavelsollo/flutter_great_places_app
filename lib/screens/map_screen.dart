import 'package:flutter/material.dart';
import 'package:flutter_great_places_app/models/place.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  final PlaceLocation initialLocation;
  final bool isSelected;

  MapScreen({this.initialLocation  = const PlaceLocation(latitude: 37.422, longitude: -122.084), this.isSelected = false});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng _pickedLocation;

  void _seelctedLocation(LatLng position){
    setState(() {
      _pickedLocation = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Map'),
        actions: <Widget>[
          if(widget.isSelected)
            IconButton(
              icon: Icon(Icons.check), 
              onPressed: _pickedLocation == null 
                ? null 
                : (){
                    Navigator.of(context).pop(_pickedLocation);
                  }
            ),
          ],
      ),
      body: GoogleMap(initialCameraPosition: CameraPosition(
        target: LatLng(widget.initialLocation.latitude, widget.initialLocation.longitude),
        zoom: 16,
        ),
        onTap: widget.isSelected ? _seelctedLocation : null,
        markers: _pickedLocation == null ? null : {
          Marker(markerId: MarkerId('m1'), position: _pickedLocation),
        },
        ),
    );
  }
}