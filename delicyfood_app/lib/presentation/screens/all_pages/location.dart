import 'package:delicyfood/presentation/screens/all_pages/hasNo_Internet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  static bool status = false;
  static LatLng Mylocation = null;

  @override
  _MapSreenState createState() => _MapSreenState();
}

class _MapSreenState extends State<MapScreen> {
  static const _initalcameraposition =
      CameraPosition(target: LatLng(30.033333, 31.233334), zoom: 11.0);

  GoogleMapController _googleMapController;

  Marker _Origin = null;

// Directions ? _info;

  @override
  void dispose() {
    _googleMapController.dispose();

    super.dispose();
  }

  void _addmarker(LatLng pos) async {
    if (_Origin == null) {
      MapScreen.status = true;
      setState(() {
        _Origin = Marker(
          markerId: const MarkerId("Origin"),
          infoWindow: const InfoWindow(title: "Location"),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          position: pos,
        );
      });
      MapScreen.Mylocation = pos;
    } else {
      setState(() {
        MapScreen.status = true;
        _Origin = Marker(
          markerId: const MarkerId("Origin"),
          infoWindow: const InfoWindow(title: "Location"),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          position: pos,
        );
      });
      MapScreen.Mylocation = pos;
    }
  }

  Widget page() {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.teal[700],
              size: 25,
            )),
        backgroundColor: Colors.white,
        centerTitle: false,
        title: Text(
          "Select The Location",
          style: TextStyle(color: Colors.teal[600]),
        ),
        actions: [
          if (_Origin != null)
            TextButton(
              onPressed: () => _googleMapController.animateCamera(
                  CameraUpdate.newCameraPosition(CameraPosition(
                      target: _Origin.position, zoom: 14.5, tilt: 50.0))),
              style: TextButton.styleFrom(
                  primary: Colors.black87,
                  textStyle: TextStyle(fontWeight: FontWeight.w600)),
              child: const Text(
                "Location",
                style: TextStyle(color: Colors.black87, fontSize: 14),
              ),
            ),
        ],
      ),
      body: SafeArea(
        child: GoogleMap(
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
          mapType: MapType.terrain,
          initialCameraPosition: _initalcameraposition,
          onMapCreated: (controller) => _googleMapController = controller,
          markers: {
            if (_Origin != null) _Origin,
          },
          onTap: _addmarker,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.black,
        backgroundColor: Colors.teal[400],
        onPressed: () {
          _googleMapController.animateCamera(CameraUpdate.newCameraPosition(
              CameraPosition(
                  target: _Origin.position, zoom: 14.5, tilt: 50.0)));
        },
        child: const Icon(Icons.location_on,color: Colors.white,),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      connectivityBuilder: (
        BuildContext context,
        ConnectivityResult connectivity,
        Widget child,
      ) {
        final bool connected = connectivity != ConnectivityResult.none;

        if (connected) {
          return page();
        } else {
          return NoInternet();
        }
      },
      child: Center(
          child: CircularProgressIndicator(
        color: Colors.teal[700],
      )),
    );
  }
}