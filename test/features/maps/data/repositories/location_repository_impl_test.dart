import 'package:flutter_test/flutter_test.dart';
import 'package:location/features/maps/data/datasources/location/location_datasource.dart';
import 'package:location/features/maps/data/models/location_dto.dart';
import 'package:location/features/maps/data/repositories/location_repository_impl.dart';
import 'package:location/features/maps/domain/repositories/location_repository.dart';
import 'package:mocktail/mocktail.dart';

class LocationDataSourceMock extends Mock implements LocationDataSource {}

void main() {
  const location = LocationDTO(
    latitude: 0,
    longitude: 0,
  );
  late LocationDataSource geoDatasource;
  late LocationDataSource ipDatasource;
  late LocationRepository locationRepository;
  setUp(() {
    geoDatasource = LocationDataSourceMock();
    ipDatasource = LocationDataSourceMock();
    locationRepository = LocationRepositoryImpl(geoDatasource, ipDatasource);
  });

  group('[DATA] - LocationRepositoryImpl', () {
    test('When get location from GeoLocationDataSource is returning the location', () async {
      when(() => geoDatasource.getLocation()).thenAnswer((_) async => location);
      final result = await locationRepository.getLocation();
      expect(result.data, isNotNull);
      expect(result.error, isNull);
      expect(result.data!.latitude, 0);
      expect(result.data!.longitude, 0);
    });
    test('When get location from GeoLocationDataSource is returning null and get location from IPLocationDataSource is returning the location', () async {
      when(() => geoDatasource.getLocation()).thenAnswer((_) async => null);
      when(() => ipDatasource.getLocation()).thenAnswer((_) async => location);
      final result = await locationRepository.getLocation();
      expect(result.data, isNotNull);
      expect(result.error, isNull);
      expect(result.data!.latitude, 0);
      expect(result.data!.longitude, 0);
    });
    test('When get location from GeoLocationDataSource is thrown an error and get location from IPLocationDataSource is returning the location', () async {
      when(() => geoDatasource.getLocation()).thenThrow(Exception('error'));
      when(() => ipDatasource.getLocation()).thenAnswer((_) async => location);
      final result = await locationRepository.getLocation();
      expect(result.data, isNotNull);
      expect(result.error, isNull);
      expect(result.data!.latitude, 0);
      expect(result.data!.longitude, 0);
    });
    test('When get location from GeoLocationDataSource is returning null and get location from IPLocationDataSource is returning also null', () async {
      when(() => geoDatasource.getLocation()).thenAnswer((_) async => null);
      when(() => ipDatasource.getLocation()).thenAnswer((_) async => null);
      final result = await locationRepository.getLocation();
      expect(result.data, isNull);
      expect(result.error, isNotNull);
      expect(result.error!.message, 'Failed to get location');
    });
    test('When get location from GeoLocationDataSource is thrown an error and get location from IPLocationDataSource is returning null', () async {
      when(() => geoDatasource.getLocation()).thenThrow(Exception('error'));
      when(() => ipDatasource.getLocation()).thenAnswer((_) async => null);
      final result = await locationRepository.getLocation();
      expect(result.data, isNull);
      expect(result.error, isNotNull);
      expect(result.error!.message, 'Failed to get location');
    });
    test('When get location from GeoLocationDataSource is thrown an error and get location from IPLocationDataSource is also thrown an error', () async {
      when(() => geoDatasource.getLocation()).thenThrow(Exception('error'));
      when(() => ipDatasource.getLocation()).thenThrow(Exception('error'));
      final result = await locationRepository.getLocation();
      expect(result.data, isNull);
      expect(result.error, isNotNull);
      expect(result.error!.message, 'Failed to get location');
    });
  });
}
