import 'package:flutter_test/flutter_test.dart';
import 'package:location/features/maps/domain/entities/location.dart';
import 'package:location/features/maps/domain/repositories/location_repository.dart';
import 'package:location/features/maps/domain/usecases/get_location_usecase.dart';
import 'package:location/utils/result.dart';
import 'package:mocktail/mocktail.dart';

class LocationRepositoryMock extends Mock implements LocationRepository {}

void main() {
  const location = Location(latitude: 0, longitude: 0);

  late LocationRepository repository;
  late GetLocationUsecase usecase;
  setUp(() {
    repository = LocationRepositoryMock();
    usecase = GetLocationUsecase(repository);
  });
  group('[DOMAIN] - GetLocationUsecase', () {
    test('When get location from repository is returning the location', () async {
      when(() => repository.getLocation()).thenAnswer((_) async => (data: location, error: null));
      final result = await usecase();
      expect(result.data, isNotNull);
      expect(result.error, isNull);
      expect(result.data!.latitude, 0);
      expect(result.data!.longitude, 0);
    });

    test('When get location from repository is returning an error', () async {
      when(() => repository.getLocation()).thenAnswer((_) async => (data: null, error: ResultError('Failed to get location')));
      final result = await usecase();
      expect(result.data, isNull);
      expect(result.error, isNotNull);
      expect(result.error!.message, 'Failed to get location');
    });
  });
}
