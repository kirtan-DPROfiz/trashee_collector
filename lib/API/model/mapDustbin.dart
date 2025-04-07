import 'package:latlong2/latlong.dart';
import 'package:trashee_collecter/core/pages/map_screen.dart';

class Dustbin {
  final String id;
  final LatLng location;
  final int fillLevel;
  //final DateTime lastCollected;
  final BinStatus status;
  final int batteryLevel;

  const Dustbin({
    required this.id,
    required this.location,
    required this.fillLevel,
    //required this.lastCollected,
    required this.status,
    required this.batteryLevel,
  });
}
