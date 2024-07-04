import 'package:geolocator/geolocator.dart';
import 'package:location/features/maps/data/datasources/location/location_datasource.dart';
import 'package:location/features/maps/data/models/location_dto.dart';
import 'package:location/services/geolocation.dart';

class GeoLocationDataSource implements LocationDataSource {
  final GeolocationService _geolocator;
  const GeoLocationDataSource(this._geolocator);

  @override
  Future<LocationDTO?> getLocation() async {
    final isServiceEnabled = await _geolocator.isLocationServiceEnabled();
    if (!isServiceEnabled) {
      return null;
    }

    var permission = await _geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await _geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return null;
    }

    final position = await _geolocator.getCurrentLocation();

    return LocationDTO(
      latitude: position.latitude,
      longitude: position.longitude,
    );
  }
}
