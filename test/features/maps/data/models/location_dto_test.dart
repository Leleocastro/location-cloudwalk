import 'package:flutter_test/flutter_test.dart';
import 'package:location/features/maps/data/models/location_dto.dart';

void main() {
  group('LocationDTO Tests', () {
    test('Construtor e toMap', () {
      const location = LocationDTO(latitude: 10.0, longitude: 20.0);
      expect(location.latitude, 10.0);
      expect(location.longitude, 20.0);

      final map = location.toMap();
      expect(map, containsPair('lat', 10.0));
      expect(map, containsPair('lon', 20.0));
    });

    test('fromJson e toJson', () {
      const jsonString = '{"lat":10.0,"lon":20.0}';
      final location = LocationDTO.fromJson(jsonString);

      expect(location.latitude, 10.0);
      expect(location.longitude, 20.0);

      final backToJsonString = location.toJson();
      expect(backToJsonString, jsonString);
    });
  });
}
