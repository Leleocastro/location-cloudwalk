import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapViewPage extends StatefulWidget {
  const MapViewPage({super.key});

  @override
  State<MapViewPage> createState() => _MapViewPageState();
}

class _MapViewPageState extends State<MapViewPage> {
  late GoogleMapController mapController;

  LatLng _center = const LatLng(-33.86, 151.20);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map View'),
      ),
      body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 15.0,
          ),
          myLocationEnabled: false,
          myLocationButtonEnabled: false,
          markers: {
            Marker(
              markerId: const MarkerId('MyLocation'),
              position: _center,
              infoWindow: const InfoWindow(
                title: 'You',
              ),
            ),
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _center = const LatLng(30.86, 100.20);
          });
          mapController.animateCamera(
            CameraUpdate.newLatLng(_center),
          );
          mapController.showMarkerInfoWindow(const MarkerId('MyLocation'));
        },
        child: const Icon(
          Icons.my_location,
        ),
      ),
    );
  }
}
