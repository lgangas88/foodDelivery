import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tarsk_app/src/mocks.dart';
import 'package:tarsk_app/src/services/LocationServices.dart';
import 'package:tarsk_app/src/services/PermissionServices.dart';
import 'package:tarsk_app/src/utils/colors.dart';

class UserLocationPage extends StatefulWidget {
  UserLocationPage({Key key}) : super(key: key);

  @override
  _UserLocationPageState createState() => _UserLocationPageState();
}

class _UserLocationPageState extends State<UserLocationPage> {
  GoogleMapController googleMapController;

  Coordinates lastCoordinate;

  Map<MarkerId, Marker> markers = Map();

  Address _position;

  void onMapCreated(GoogleMapController mapController) {
    googleMapController = mapController;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.check),
              onPressed: () {
                if(_position != null) {
                  addresses.firstWhere((a) => a['isMain'])['isMain'] = false;
                  addresses.add({
                    'isMain': true,
                    'address': _position.addressLine
                  });
                  Navigator.pop(context);
                }
              },
            )
          ],
        ),
        body: Stack(
          children: <Widget>[
            GoogleMap(
              onCameraMove: (CameraPosition position) {
                final markerId = MarkerId('mainMarker');
                final marker = Marker(
                  consumeTapEvents: false,
                    markerId: markerId,
                    position: LatLng(
                        position.target.latitude, position.target.longitude));

                setState(() {
                  markers[markerId] = marker;
                });

                lastCoordinate = Coordinates(position.target.latitude, position.target.longitude);

              },
              onCameraIdle: () async {
                List position = await LocationServices.getAddressFromCoordinate(lastCoordinate);
                if(position.isNotEmpty) {
                  setState(() {
                    _position = position[0];
                  });
                }
              },
              myLocationEnabled: true,
              zoomControlsEnabled: false,
              onMapCreated: onMapCreated,
              initialCameraPosition: CameraPosition(
                target: LatLng(-12.0262676, -77.1278629),
                zoom: 14.0,

              ),
              markers: Set.of(markers.values),
              
            )
          ],
        ),
      ),
    );
  }

  // googleMap() {
  //   return FutureBuilder(
  //       future: LocationServices.getCurrentPosition(),
  //       builder: (_, AsyncSnapshot<Position> response) {
  //         if (response.connectionState == ConnectionState.waiting) {
  //           return Center(
  //             child: CircularProgressIndicator(),
  //           );
  //         }

  //         return;
  //       });
  // }
}
