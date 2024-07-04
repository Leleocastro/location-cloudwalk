import 'package:geolocator/geolocator.dart';

class FakeGeolocator extends GeolocatorPlatform {
  final _position = Position(
    latitude: 0,
    longitude: 0,
    timestamp: DateTime(2024),
    accuracy: 0,
    altitude: 0,
    altitudeAccuracy: 0,
    heading: 0,
    headingAccuracy: 0,
    speed: 0,
    speedAccuracy: 0,
  );

  final _permission = LocationPermission.whileInUse;

  @override
  Future<LocationPermission> checkPermission() async {
    return _permission;
  }

  @override
  Future<Position> getCurrentPosition({LocationSettings? locationSettings}) async {
    return _position;
  }

  @override
  Future<Position?> getLastKnownPosition({bool forceLocationManager = false}) async {
    return _position;
  }

  @override
  Stream<Position> getPositionStream({LocationSettings? locationSettings}) async* {
    yield _position;
  }

  @override
  Future<bool> isLocationServiceEnabled() async {
    return true;
  }

  @override
  Future<LocationPermission> requestPermission() async {
    return _permission;
  }
}
