import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/services/geolocation.dart';

import '../test_utils/fake_geolocator.dart';

void main() {
  late GeolocationService geolocationService;
  late FakeGeolocator mockGeolocator;

  setUp(() {
    mockGeolocator = FakeGeolocator();
    GeolocatorPlatform.instance = mockGeolocator;
    geolocationService = GeolocationService();
  });

  group('GeolocationService', () {
    test('getCurrentLocation returns a Position', () async {
      final result = await geolocationService.getCurrentLocation();
      expect(result, isA<Position>());
    });

    test('getLastKnownLocation returns a Position', () async {
      final result = await geolocationService.getLastKnownLocation();
      expect(result, isA<Position>());
    });

    test('isLocationServiceEnabled returns true', () async {
      final result = await geolocationService.isLocationServiceEnabled();
      expect(result, isTrue);
    });

    test('listenToLocationChanges returns a Stream<Position>', () {
      final result = geolocationService.listenToLocationChanges();
      expect(result, isA<Stream<Position>>());
    });

    test('requestPermission returns a LocationPermission', () async {
      final result = await geolocationService.requestPermission();
      expect(result, isA<LocationPermission>());
    });

    test('checkPermission returns a LocationPermission', () async {
      final result = await geolocationService.checkPermission();
      expect(result, isA<LocationPermission>());
    });
  });
}
