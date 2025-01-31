import 'dart:convert';

class LocationDTO {
  final double latitude;
  final double longitude;

  const LocationDTO({
    required this.latitude,
    required this.longitude,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'lat': latitude,
      'lon': longitude,
    };
  }

  factory LocationDTO.fromMap(Map<String, dynamic> map) {
    return LocationDTO(
      latitude: map['lat'] as double,
      longitude: map['lon'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory LocationDTO.fromJson(String source) => LocationDTO.fromMap(json.decode(source) as Map<String, dynamic>);
}
