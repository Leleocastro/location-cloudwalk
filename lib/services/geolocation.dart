import 'package:geolocator/geolocator.dart';

class GeolocationService {
  Future<Position> getCurrentLocation() async {
    return Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  Future<Position?> getLastKnownLocation() async {
    return Geolocator.getLastKnownPosition();
  }

  Future<bool> isLocationServiceEnabled() async {
    return Geolocator.isLocationServiceEnabled();
  }

  Stream<Position> listenToLocationChanges() {
    return Geolocator.getPositionStream();
  }

  Future<LocationPermission> requestPermission() async {
    return Geolocator.requestPermission();
  }

  Future<LocationPermission> checkPermission() async {
    return Geolocator.checkPermission();
  }
}
