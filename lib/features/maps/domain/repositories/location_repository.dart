import 'package:location/features/maps/domain/entities/location.dart';
import 'package:location/utils/result.dart';

abstract class LocationRepository {
  Future<Result<Location>> getLocation();
}
