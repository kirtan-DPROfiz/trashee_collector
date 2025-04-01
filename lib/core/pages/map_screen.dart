/* 
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Smart Bin Map")),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(37.7749, -122.4194), // Default to San Francisco
          initialZoom: 13.0,
        ),
        children: [
          TileLayer(
            urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: LatLng(37.7749, -122.4194),
                width: 40.0,
                height: 40.0,
                child: Icon(Icons.location_on, color: Colors.red, size: 40),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
 */

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController _mapController;
  final LatLng _defaultLocation =
      const LatLng(20.5937, 78.9629); // Center of India
  Set<Marker> _markers = {};
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchDustbins();
  }

  Future<void> _fetchDustbins() async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://intervein.dprofiz.com/Trashee_Collector/Dustbin/get_dustbins.php'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        _createMarkers(data['dustbins']);
      } else {
        throw Exception('Failed to load dustbins');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _createMarkers(List<dynamic> dustbins) {
    final markers = <Marker>{};

    for (final dustbin in dustbins) {
      final fillLevel = dustbin['fill_level'] as int;
      final markerId = MarkerId('dustbin_${dustbin['id']}');
      final position = LatLng(
        double.parse(dustbin['latitude']),
        double.parse(dustbin['longitude']),
      );

      markers.add(
        Marker(
          markerId: markerId,
          position: position,
          icon: _getMarkerIcon(fillLevel),
          infoWindow: InfoWindow(
            title: 'Dustbin #${dustbin['id']}',
            snippet:
                'Fill Level: $fillLevel%\nLast Collected: ${dustbin['last_collected']}',
          ),
          onTap: () {
            // You can add navigation to collection screen here
          },
        ),
      );
    }

    setState(() => _markers = markers);
  }

  BitmapDescriptor _getMarkerIcon(int fillLevel) {
    if (fillLevel >= 80) {
      return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed);
    } else if (fillLevel >= 50) {
      return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange);
    } else if (fillLevel >= 20) {
      return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow);
    } else {
      return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dustbin Locations'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _fetchDustbins,
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : GoogleMap(
              onMapCreated: (controller) => _mapController = controller,
              initialCameraPosition: CameraPosition(
                target: _defaultLocation,
                zoom: 5,
              ),
              markers: _markers,
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _mapController.animateCamera(
          CameraUpdate.newLatLng(_defaultLocation),
        ),
        child: const Icon(Icons.my_location),
      ),
    );
  }
}
