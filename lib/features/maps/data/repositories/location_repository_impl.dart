import 'package:location/features/maps/data/datasources/location/location_datasource.dart';
import 'package:location/features/maps/domain/entities/location.dart';
import 'package:location/features/maps/domain/repositories/location_repository.dart';
import 'package:location/utils/result.dart';

class LocationRepositoryImpl implements LocationRepository {
  final LocationDataSource _geoDataSource;
  final LocationDataSource _ipDataSource;

  const LocationRepositoryImpl(this._geoDataSource, this._ipDataSource);

  @override
  Future<Result<Location>> getLocation() async {
    ResultError? error;
    try {
      final geoLocation = await _geoDataSource.getLocation();
      if (geoLocation != null) {
        final location = Location(
          latitude: geoLocation.latitude,
          longitude: geoLocation.longitude,
        );

        return (data: location, error: null);
      }
    } catch (e) {
      error = ResultError(e.toString());
    }

    try {
      final ipLocation = await _ipDataSource.getLocation();

      if (ipLocation == null) {
        error = ResultError('Failed to get location');
        return (data: null, error: error);
      }

      final location = Location(
        latitude: ipLocation.latitude,
        longitude: ipLocation.longitude,
      );

      return (data: location, error: null);
    } catch (e) {
      error = ResultError('Failed to get location');
    }

    return (data: null, error: error);
  }
}
