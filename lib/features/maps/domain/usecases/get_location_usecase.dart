import 'package:location/features/maps/domain/entities/location.dart';
import 'package:location/features/maps/domain/repositories/location_repository.dart';
import 'package:location/utils/result.dart';

class GetLocationUsecase {
  final LocationRepository _repository;

  GetLocationUsecase(this._repository);

  Future<Result<Location>> call() async {
    return await _repository.getLocation();
  }
}
