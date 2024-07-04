import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/features/maps/data/datasources/location/geo_location_datasource.dart';
import 'package:location/services/geolocation.dart';
import 'package:mocktail/mocktail.dart';

class GeolocationServiceMock extends Mock implements GeolocationService {}

void main() {
  final position = Position(
    longitude: 0,
    latitude: 0,
    timestamp: DateTime(2024),
    accuracy: 0,
    altitude: 0,
    altitudeAccuracy: 0,
    heading: 0,
    headingAccuracy: 0,
    speed: 0,
    speedAccuracy: 0,
  );
  late GeolocationService geolocationServiceMock;
  late GeoLocationDataSource geoLocationDataSource;
  setUp(() {
    geolocationServiceMock = GeolocationServiceMock();
    geoLocationDataSource = GeoLocationDataSource(geolocationServiceMock);
  });

  group('[DATA] - GeoLocationDatasource', () {
    test('When location service is disabled', () async {
      when(() => geolocationServiceMock.isLocationServiceEnabled()).thenAnswer((_) async => false);
      final result = await geoLocationDataSource.getLocation();
      expect(result, isNull);
    });

    test('When location service is enabled, but check permission is denied forever', () async {
      when(() => geolocationServiceMock.isLocationServiceEnabled()).thenAnswer((_) async => true);
      when(() => geolocationServiceMock.checkPermission()).thenAnswer((_) async => LocationPermission.deniedForever);
      final result = await geoLocationDataSource.getLocation();
      expect(result, isNull);
    });

    test('When location service is enabled, but check permission is denied and request permission is denied', () async {
      when(() => geolocationServiceMock.isLocationServiceEnabled()).thenAnswer((_) async => true);
      when(() => geolocationServiceMock.checkPermission()).thenAnswer((_) async => LocationPermission.denied);
      when(() => geolocationServiceMock.requestPermission()).thenAnswer((_) async => LocationPermission.denied);
      final result = await geoLocationDataSource.getLocation();
      expect(result, isNull);
    });

    test('When location service is enabled, but check permission is denied and request permission is denied forever', () async {
      when(() => geolocationServiceMock.isLocationServiceEnabled()).thenAnswer((_) async => true);
      when(() => geolocationServiceMock.checkPermission()).thenAnswer((_) async => LocationPermission.denied);
      when(() => geolocationServiceMock.requestPermission()).thenAnswer((_) async => LocationPermission.deniedForever);
      final result = await geoLocationDataSource.getLocation();
      expect(result, isNull);
    });

    test('When location service is enabled, but check permission is denied and request permission is always accepted', () async {
      when(() => geolocationServiceMock.isLocationServiceEnabled()).thenAnswer((_) async => true);
      when(() => geolocationServiceMock.checkPermission()).thenAnswer((_) async => LocationPermission.denied);
      when(() => geolocationServiceMock.requestPermission()).thenAnswer((_) async => LocationPermission.always);
      when(() => geolocationServiceMock.getCurrentLocation()).thenAnswer((_) async => position);
      final result = await geoLocationDataSource.getLocation();
      expect(result, isNotNull);
      expect(result!.latitude, position.latitude);
      expect(result.longitude, position.longitude);
    });

    test('When location service is enabled, but check permission is denied and request permission is accepted while in use', () async {
      when(() => geolocationServiceMock.isLocationServiceEnabled()).thenAnswer((_) async => true);
      when(() => geolocationServiceMock.checkPermission()).thenAnswer((_) async => LocationPermission.denied);
      when(() => geolocationServiceMock.requestPermission()).thenAnswer((_) async => LocationPermission.whileInUse);
      when(() => geolocationServiceMock.getCurrentLocation()).thenAnswer((_) async => position);
      final result = await geoLocationDataSource.getLocation();
      expect(result, isNotNull);
      expect(result!.latitude, position.latitude);
      expect(result.longitude, position.longitude);
    });

    test('When location service is enabled and check permission is always accepted', () async {
      when(() => geolocationServiceMock.isLocationServiceEnabled()).thenAnswer((_) async => true);
      when(() => geolocationServiceMock.checkPermission()).thenAnswer((_) async => LocationPermission.always);
      when(() => geolocationServiceMock.getCurrentLocation()).thenAnswer((_) async => position);
      final result = await geoLocationDataSource.getLocation();
      expect(result, isNotNull);
      expect(result!.latitude, position.latitude);
      expect(result.longitude, position.longitude);
    });

    test('When location service is enabled and check permission is accepted while in use', () async {
      when(() => geolocationServiceMock.isLocationServiceEnabled()).thenAnswer((_) async => true);
      when(() => geolocationServiceMock.checkPermission()).thenAnswer((_) async => LocationPermission.whileInUse);
      when(() => geolocationServiceMock.getCurrentLocation()).thenAnswer((_) async => position);
      final result = await geoLocationDataSource.getLocation();
      expect(result, isNotNull);
      expect(result!.latitude, position.latitude);
      expect(result.longitude, position.longitude);
    });
  });
}
