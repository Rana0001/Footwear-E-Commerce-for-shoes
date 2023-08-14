import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({super.key});

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  GoogleMapController? _mapcontroller;
  final Set<Marker> _markers = {};
  final LatLng _myLocation = const LatLng(26.894471, 86.624870);

  @override
  void initState() {
    _markers.add(
      Marker(
          markerId: MarkerId(_myLocation.toString()),
          position: _myLocation,
          infoWindow: const InfoWindow(
            title: "Prashant's Residential",
            snippet: "Murkuchi",
          ),
          icon: BitmapDescriptor.defaultMarker),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Google Maps"),
        centerTitle: true,
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(target: _myLocation, zoom: 18),
        mapType: MapType.hybrid,
        markers: _markers,
        onMapCreated: (controller) {
          setState(() {
            _mapcontroller = controller;
          });
        },
      ),
    );
  }
}
