import 'package:location/features/maps/data/models/location_dto.dart';

abstract class LocationDataSource {
  Future<LocationDTO?> getLocation();
}
