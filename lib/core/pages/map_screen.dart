// // import 'package:flutter/material.dart';
// // import 'package:flutter_map/flutter_map.dart';
// // import 'package:latlong2/latlong.dart';

// // class MapScreen extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text("Smart Bin Map")),
// //       body: FlutterMap(
// //         options: MapOptions(
// //           initialCenter: LatLng(37.7749, -122.4194), // Default to San Francisco
// //           initialZoom: 1.0, // Set the zoom level to show the whole Earth (lower zoom level shows more area)
// //           minZoom: 1.0, // Minimum zoom level (zoom out to the whole Earth)
// //           maxZoom: 19.0, // Maximum zoom level (to allow zooming in further)
// //         ),
// //         children: [
// //           TileLayer(
// //             urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
// //           ),
// //           MarkerLayer(
// //             markers: [
// //               Marker(
// //                 point: LatLng(37.7749, -122.4194),
// //                 width: 40.0,
// //                 height: 40.0,
// //                 child: Icon(Icons.location_on, color: Colors.red, size: 40),
// //               ),
// //             ],
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart';

// class MapScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Smart Bin Map")), // AppBar with title
//       body: FlutterMap(
//         options: MapOptions(
//           initialCenter: LatLng(0.0, 0.0), // Center map to (0,0) (Equator and Prime Meridian)
//           initialZoom: 1.0, // Set the zoom level to show the whole Earth
//           minZoom: 1.0, // Minimum zoom level to ensure full Earth view
//           maxZoom: 19.0, // Allow zooming in for more details
//           onPositionChanged: (position, hasGesture) {
//             // Log whenever the map's position changes
//             print("Map position changed: ${position.center} | Zoom level: ${position.zoom}");
//           },
//         ),
//         children: [
//           // TileLayer to display OpenStreetMap tiles
//           TileLayer(
//             urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png", // OpenStreetMap URL
//           ),
//           MarkerLayer(
//             markers: [
//               Marker(
//                 point: LatLng(37.7749, -122.4194), // San Francisco coordinates
//                 width: 40.0,
//                 height: 40.0,
//                 child: Icon(Icons.location_on, color: Colors.red, size: 40), // Marker for San Francisco
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart';

// class MapScreen extends StatelessWidget {
//   // Sample data, this could come from an API or database
//   final mapData = map(dustbins: [
//     Dustbins(
//       latitude: "37.7749",
//       longitude: "-122.4194",
//       fillLevel: 50,
//       lastCollected: "2025-04-01",
//       espStatus: "Active",
//     ),
//     Dustbins(
//       latitude: "40.7128",
//       longitude: "-74.0060",
//       fillLevel: 80,
//       lastCollected: "2025-03-30",
//       espStatus: "Inactive",
//     ),
//     Dustbins(
//       latitude: "34.0522",
//       longitude: "-118.2437",
//       fillLevel: 30,
//       lastCollected: "2025-03-29",
//       espStatus: "Active",
//     ),
//   ]);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Smart Bin Map")), // AppBar title
//       body: FlutterMap(
//         options: MapOptions(
//           initialCenter: LatLng(0.0, 0.0), // Center to (0, 0) for showing the whole Earth
//           initialZoom: 1.0, // Zoom out to show the entire Earth
//           minZoom: 1.0, // Minimum zoom level to keep the whole Earth in view
//           maxZoom: 19.0, // Maximum zoom level to allow zooming in
//           onPositionChanged: (position, hasGesture) {
//             print("Map position changed: ${position.center} | Zoom level: ${position.zoom}");
//           },
//         ),
//         children: [
//           TileLayer(
//             urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png", // OpenStreetMap tiles
//           ),
//           MarkerLayer(
//             markers: mapData.dustbins?.map((dustbin) {
//               // Convert each Dustbin object to a marker
//               return Marker(
//                 point: LatLng(
//                   double.tryParse(dustbin.latitude ?? "0") ?? 0.0, // Latitude
//                   double.tryParse(dustbin.longitude ?? "0") ?? 0.0, // Longitude
//                 ),
//                 width: 40.0,
//                 height: 40.0,
//                 child: Icon(
//                   Icons.location_on,
//                   color: dustbin.fillLevel! > 50 ? Colors.green : Colors.red, // Green if fill level > 50
//                   size: 40,
//                 ),
//               );
//             }).toList() ?? [],
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Class for parsing map data
// class map {
//   List<Dustbins>? dustbins;

//   map({this.dustbins});

//   map.fromJson(Map<String, dynamic> json) {
//     if (json['dustbins'] != null) {
//       dustbins = <Dustbins>[];
//       json['dustbins'].forEach((v) {
//         dustbins!.add(Dustbins.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.dustbins != null) {
//       data['dustbins'] = this.dustbins!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// // Class for Dustbin data structure
// class Dustbins {
//   String? latitude;
//   String? longitude;
//   int? fillLevel;
//   String? lastCollected;
//   String? espStatus;

//   Dustbins({
//     this.latitude,
//     this.longitude,
//     this.fillLevel,
//     this.lastCollected,
//     this.espStatus,
//   });

//   Dustbins.fromJson(Map<String, dynamic> json) {
//     latitude = json['latitude'];
//     longitude = json['longitude'];
//     fillLevel = json['fill_level'];
//     lastCollected = json['last_collected'];
//     espStatus = json['esp_status'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['latitude'] = this.latitude;
//     data['longitude'] = this.longitude;
//     data['fill_level'] = this.fillLevel;
//     data['last_collected'] = this.lastCollected;
//     data['esp_status'] = this.espStatus;
//     return data;
//   }
// }

// // worked map
// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart';
// import 'dart:convert';  // For json decoding
// import 'package:http/http.dart' as http;  // For HTTP requests

// class MapScreen extends StatefulWidget {
//   const MapScreen({super.key});

//   @override
//   State<MapScreen> createState() => _MapScreenState();
// }

// class _MapScreenState extends State<MapScreen> {
//   final MapController _mapController = MapController();
//   bool _isLoading = true;
//   bool _isMapReady = false;
//   late List<Dustbin> _dustbins = [];
//   String? _errorMessage;

//   @override
//   void initState() {
//     super.initState();
//     _loadBinData();
//   }

//   Future<void> _loadBinData() async {
//     try {
//       setState(() => _isLoading = true);
//       await Future.delayed(const Duration(seconds: 1)); // Simulate network delay

//       final data = await _fetchBinData();

//       setState(() {
//         _dustbins = data;
//         _isLoading = false;
//       });

//       if (_dustbins.isNotEmpty && _isMapReady) {
//         _zoomToBins();
//       }
//     } catch (e) {
//       setState(() {
//         _errorMessage = 'Failed to load bin data: ${e.toString()}';
//         _isLoading = false;
//       });
//     }
//   }

// Future<List<Dustbin>> _fetchBinData() async {
//   final url = Uri.parse('https://intervein.dprofiz.com/Trashee_Collector/Dustbin/get_dustbins.php');

//   try {
//     final response = await http.get(url);

//     if (response.statusCode == 200) {
//       final jsonData = json.decode(response.body);
//       final List<dynamic> binsJson = jsonData['dustbins'];

//       return binsJson.map((binJson) {
//         return Dustbin(
//           id: '${binJson['latitude']}_${binJson['longitude']}', // Creating unique ID from coordinates
//           location: LatLng(
//             double.parse(binJson['latitude']),
//             double.parse(binJson['longitude']),
//           ),
//           fillLevel: int.parse(binJson['fill_level'].toString()),
//           lastCollected: DateTime.parse(binJson['last_collected']),
//           status: binJson['esp_status'] == 'online'
//               ? BinStatus.active
//               : BinStatus.inactive,
//           batteryLevel: 100, // Assuming full battery since it's not in the response
//         );
//       }).toList();
//     } else {
//       throw Exception('Failed to load dustbins: ${response.statusCode}');
//     }
//   } catch (e) {
//     throw Exception('Failed to fetch dustbin data: $e');
//   }
// }

//   void _zoomToBins() {
//     try {
//       if (_dustbins.isEmpty || !_isMapReady) return;

//       final bounds = LatLngBounds.fromPoints(
//         _dustbins.map((bin) => bin.location).toList(),
//       );

//       WidgetsBinding.instance.addPostFrameCallback((_) {
//         _mapController.fitCamera(
//           CameraFit.bounds(
//             bounds: bounds,
//             padding: const EdgeInsets.all(50),
//           ),
//         );
//       });
//     } catch (e) {
//       debugPrint('Zoom error: $e');
//     }
//   }

//   void _refreshData() {
//     setState(() {
//       _errorMessage = null;
//     });
//     _loadBinData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Smart Bin Monitoring'),
//         centerTitle: true,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.refresh),
//             onPressed: _refreshData,
//             tooltip: 'Refresh data',
//           ),
//           IconButton(
//             icon: const Icon(Icons.my_location),
//             onPressed: _zoomToBins,
//             tooltip: 'Zoom to all bins',
//           ),
//         ],
//       ),
//       body: _buildMapContent(),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _zoomToBins,
//         child: const Icon(Icons.zoom_out_map),
//         tooltip: 'Show all bins',
//       ),
//     );
//   }

//   Widget _buildMapContent() {
//     if (_isLoading) {
//       return const Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             CircularProgressIndicator(),
//             SizedBox(height: 16),
//             Text('Loading bin data...'),
//           ],
//         ),
//       );
//     }

//     if (_errorMessage != null) {
//       return Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(_errorMessage!),
//             const SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: _refreshData,
//               child: const Text('Retry'),
//             ),
//           ],
//         ),
//       );
//     }

//     return Stack(
//       children: [
//         FlutterMap(
//           mapController: _mapController,
//           options: MapOptions(
//             initialCenter: const LatLng(20.0, 0.0),
//             initialZoom: 2.0,
//             minZoom: 1.0,
//             maxZoom: 19.0,
//             interactionOptions: const InteractionOptions(
//               flags: InteractiveFlag.all & ~InteractiveFlag.rotate,
//             ),
//             onMapReady: () {
//               setState(() => _isMapReady = true);
//               if (_dustbins.isNotEmpty) {
//                 _zoomToBins();
//               }
//             },
//           ),
//           children: [
//             TileLayer(
//               urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
//               subdomains: const ['a', 'b', 'c'],
//               // userAgentPackageName: 'com.example.smart_bin_app',
//               userAgentPackageName: 'com.example.trashee_collector',
//             ),
//             MarkerLayer(
//               markers: _dustbins.map(_buildBinMarker).toList(),
//             ),
//           ],
//         ),
//         Positioned(
//           bottom: 16,
//           right: 16,
//           child: _buildLegend(),
//         ),
//       ],
//     );
//   }

//   Marker _buildBinMarker(Dustbin bin) {
//     return Marker(
//       point: bin.location,
//       width: 48.0,
//       height: 48.0,
//       child: GestureDetector(
//         onTap: () => _showBinDetails(bin),
//         child: Tooltip(
//           message: _buildTooltipText(bin),
//           child: Stack(
//             alignment: Alignment.center,
//             children: [
//               Icon(
//                 Icons.location_on,
//                 color: _getBinColor(bin),
//                 size: 48.0,
//               ),
//               Positioned(
//                 top: 8,
//                 child: Text(
//                   '${bin.fillLevel}%',
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontSize: 10,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               if (bin.batteryLevel < 20)
//                 const Positioned(
//                   right: 0,
//                   bottom: 0,
//                   child: Icon(
//                     Icons.battery_alert,
//                     color: Colors.red,
//                     size: 16,
//                   ),
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void _showBinDetails(Dustbin bin) {
//     showModalBottomSheet(
//       context: context,
//       builder: (context) => BinDetailsSheet(bin: bin),
//       isScrollControlled: true,
//     );
//   }

//   String _buildTooltipText(Dustbin bin) {
//     return '''
//     Bin ID: ${bin.id}
//     Fill Level: ${bin.fillLevel}%
//     Last Collected: ${bin.lastCollected.toString().split(' ')[0]}
//     Status: ${bin.status.toString().split('.').last}
//     Battery: ${bin.batteryLevel}%
//     ''';
//   }

//   Color _getBinColor(Dustbin bin) {
//     if (bin.status != BinStatus.active) return Colors.grey;

//     return bin.fillLevel > 75
//       ? Colors.red[700]!
//       : bin.fillLevel > 50
//         ? Colors.orange[700]!
//         : Colors.green[700]!;
//   }

//   Widget _buildLegend() {
//     return Card(
//       elevation: 4,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text('Bin Status:', style: TextStyle(fontWeight: FontWeight.bold)),
//             const SizedBox(height: 4),
//             _buildLegendItem('Empty (<50%)', Colors.green[700]!),
//             _buildLegendItem('Medium (50-75%)', Colors.orange[700]!),
//             _buildLegendItem('Full (>75%)', Colors.red[700]!),
//             _buildLegendItem('Inactive', Colors.grey),
//             _buildLegendItem('Low Battery', Colors.red),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildLegendItem(String text, Color color) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 2.0),
//       child: Row(
//         children: [
//           Container(
//             width: 16,
//             height: 16,
//             decoration: BoxDecoration(
//               color: color,
//               borderRadius: BorderRadius.circular(4),
//             ),
//           ),
//           const SizedBox(width: 8),
//           Text(text, style: const TextStyle(fontSize: 12)),
//         ],
//       ),
//     );
//   }
// }

// class BinDetailsSheet extends StatelessWidget {
//   final Dustbin bin;

//   const BinDetailsSheet({super.key, required this.bin});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Center(
//             child: Text(
//               'Bin #${bin.id}',
//               style: Theme.of(context).textTheme.titleLarge?.copyWith(
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           const SizedBox(height: 16),
//           _buildDetailRow('Status:', bin.status.toString().split('.').last),
//           _buildDetailRow('Fill Level:', '${bin.fillLevel}%'),
//           _buildDetailRow('Battery Level:', '${bin.batteryLevel}%'),
//           _buildDetailRow('Last Collected:',
//             '${bin.lastCollected.day}/${bin.lastCollected.month}/${bin.lastCollected.year}'),
//           _buildDetailRow('Coordinates:',
//             '${bin.location.latitude.toStringAsFixed(4)}, ${bin.location.longitude.toStringAsFixed(4)}'),
//           const SizedBox(height: 24),
//           SizedBox(
//             width: double.infinity,
//             child: ElevatedButton(
//               onPressed: () => Navigator.pop(context),
//               style: ElevatedButton.styleFrom(
//                 padding: const EdgeInsets.symmetric(vertical: 16),
//               ),
//               child: const Text('Close'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildDetailRow(String label, String value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 6.0),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(
//             width: 100,
//             child: Text(
//               label,
//               style: const TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 14,
//               ),
//             ),
//           ),
//           const SizedBox(width: 8),
//           Expanded(
//             child: Text(
//               value,
//               style: const TextStyle(fontSize: 14),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// enum BinStatus { active, inactive, maintenance }

// class Dustbin {
//   final String id;
//   final LatLng location;
//   final int fillLevel;
//   final DateTime lastCollected;
//   final BinStatus status;
//   final int batteryLevel;

//   const Dustbin({
//     required this.id,
//     required this.location,
//     required this.fillLevel,
//     required this.lastCollected,
//     required this.status,
//     required this.batteryLevel,
//   });
// }

// worked map
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:trashee_collecter/API/model/mapDustbin.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:latlong2/latlong.dart';
import 'dart:convert'; // For json decoding
import 'package:http/http.dart' as http; // For HTTP requests

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final MapController _mapController = MapController();
  bool _isLoading = true;
  bool _isMapReady = false;
  late List<Dustbin> _dustbins = [];
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadBinData();
  }

  Future<void> _loadBinData() async {
    try {
      setState(() => _isLoading = true);
      await Future.delayed(
          const Duration(seconds: 1)); // Simulate network delay

      final data = await _fetchBinData();

      setState(() {
        _dustbins = data;
        _isLoading = false;
      });

      if (_dustbins.isNotEmpty && _isMapReady) {
        _zoomToBins();
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to load bin data: ${e.toString()}';
        _isLoading = false;
      });
    }
  }

  Future<List<Dustbin>> _fetchBinData() async {
    final url = Uri.parse(
        'https://intervein.dprofiz.com/Trashee_Collector/Dustbin/get_dustbins.php');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final List<dynamic> binsJson = jsonData['dustbins'];

        return binsJson.map((binJson) {
          return Dustbin(
            id: '${binJson['latitude']}_${binJson['longitude']}', // Creating unique ID from coordinates
            location: LatLng(
              double.parse(binJson['latitude']),
              double.parse(binJson['longitude']),
            ),
            fillLevel: int.parse(binJson['fill_level'].toString()),
            // lastCollected: DateTime.parse(binJson['last_collected']),
            status: binJson['esp_status'] == 'online'
                ? BinStatus.active
                : BinStatus.inactive,
            batteryLevel:
                100, // Assuming full battery since it's not in the response
          );
        }).toList();
      } else {
        throw Exception('Failed to load dustbins: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to fetch dustbin data: $e');
    }
  }

  void _zoomToBins() {
    try {
      if (_dustbins.isEmpty || !_isMapReady) return;

      final bounds = LatLngBounds.fromPoints(
        _dustbins.map((bin) => bin.location).toList(),
      );

      WidgetsBinding.instance.addPostFrameCallback((_) {
        _mapController.fitCamera(
          CameraFit.bounds(
            bounds: bounds,
            padding: const EdgeInsets.all(50),
          ),
        );
      });
    } catch (e) {
      debugPrint('Zoom error: $e');
    }
  }

  void _refreshData() {
    setState(() {
      _errorMessage = null;
    });
    _loadBinData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Bin Monitoring'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _refreshData,
            tooltip: 'Refresh data',
          ),
          IconButton(
            icon: const Icon(Icons.my_location),
            onPressed: _zoomToBins,
            tooltip: 'Zoom to all bins',
          ),
        ],
      ),
      body: _buildMapContent(),
      floatingActionButton: FloatingActionButton(
        onPressed: _zoomToBins,
        child: const Icon(Icons.zoom_out_map),
        tooltip: 'Show all bins',
      ),
    );
  }

  Widget _buildMapContent() {
    if (_isLoading) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Loading bin data...'),
          ],
        ),
      );
    }

    if (_errorMessage != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_errorMessage!),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _refreshData,
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    return Stack(
      children: [
        FlutterMap(
          mapController: _mapController,
          options: MapOptions(
            initialCenter: const LatLng(20.0, 0.0),
            initialZoom: 2.0,
            minZoom: 1.0,
            maxZoom: 19.0,
            interactionOptions: const InteractionOptions(
              flags: InteractiveFlag.all & ~InteractiveFlag.rotate,
            ),
            onMapReady: () {
              setState(() => _isMapReady = true);
              if (_dustbins.isNotEmpty) {
                _zoomToBins();
              }
            },
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
              subdomains: const ['a', 'b', 'c'],
              // userAgentPackageName: 'com.example.smart_bin_app',
              userAgentPackageName: 'com.example.trashee_collector',
            ),
            MarkerLayer(
              markers: _dustbins.map(_buildBinMarker).toList(),
            ),
          ],
        ),
        Positioned(
          bottom: 16,
          right: 16,
          child: _buildLegend(),
        ),
      ],
    );
  }

  Marker _buildBinMarker(Dustbin bin) {
    return Marker(
      point: bin.location,
      width: 48.0,
      height: 48.0,
      child: GestureDetector(
        onTap: () => _showBinDetails(bin),
        child: Tooltip(
          message: _buildTooltipText(bin),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Icon(
                Icons.location_on,
                color: _getBinColor(bin),
                size: 48.0,
              ),
              Positioned(
                top: 8,
                child: Text(
                  '${bin.fillLevel}%',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              if (bin.batteryLevel < 20)
                const Positioned(
                  right: 0,
                  bottom: 0,
                  child: Icon(
                    Icons.battery_alert,
                    color: Colors.red,
                    size: 16,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _showBinDetails(Dustbin bin) {
    showModalBottomSheet(
      context: context,
      builder: (context) => BinDetailsSheet(
          bin: bin, mapController: _mapController), // Pass mapController
      isScrollControlled: true,
    );
  }

  String _buildTooltipText(Dustbin bin) {
    return '''
    Bin ID: ${bin.id}
    Fill Level: ${bin.fillLevel}%
    Status: ${bin.status.toString().split('.').last}
    Battery: ${bin.batteryLevel}%
    ''';
  } /*  Last Collected: ${bin.lastCollected.toString().split(' ')[0]} */

  Color _getBinColor(Dustbin bin) {
    if (bin.status != BinStatus.active) return Colors.grey;

    return bin.fillLevel > 75
        ? Colors.red[700]!
        : bin.fillLevel > 50
            ? Colors.orange[700]!
            : Colors.green[700]!;
  }

  Widget _buildLegend() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Bin Status:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            _buildLegendItem('Empty (<50%)', Colors.green[700]!),
            _buildLegendItem('Medium (50-75%)', Colors.orange[700]!),
            _buildLegendItem('Full (>75%)', Colors.red[700]!),
            _buildLegendItem('Inactive', Colors.grey),
            _buildLegendItem('Low Battery', Colors.red),
          ],
        ),
      ),
    );
  }

  Widget _buildLegendItem(String text, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(width: 8),
          Text(text, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}

class BinDetailsSheet extends StatelessWidget {
  final Dustbin bin;

  const BinDetailsSheet(
      {super.key, required this.bin, required MapController mapController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Text(
              'Bin #${bin.id}',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          const SizedBox(height: 16),
          _buildDetailRow('Status:', bin.status.toString().split('.').last),
          _buildDetailRow('Fill Level:', '${bin.fillLevel}%'),
          _buildDetailRow('Battery Level:', '${bin.batteryLevel}%'),
          //  _buildDetailRow('Last Collected:', '${bin.lastCollected.day}/${bin.lastCollected.month}/${bin.lastCollected.year}'),
          _buildDetailRow('Coordinates:',
              '${bin.location.latitude.toStringAsFixed(4)}, ${bin.location.longitude.toStringAsFixed(4)}'),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text('Close'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => _openGoogleMaps(bin.location),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text('Navigate',
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _openGoogleMaps(LatLng location) async {
    final url =
        'https://www.google.com/maps/search/?api=1&query=${location.latitude},${location.longitude}';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      debugPrint('Could not open Google Maps');
    }
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}

enum BinStatus { active, inactive, maintenance }
