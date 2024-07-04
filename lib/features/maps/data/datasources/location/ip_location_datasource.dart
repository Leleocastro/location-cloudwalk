import 'package:location/features/maps/data/datasources/location/location_datasource.dart';
import 'package:location/features/maps/data/models/location_dto.dart';
import 'package:location/services/client/http_client.dart';

class IPLocationDataSource implements LocationDataSource {
  final AppHttpClient _client;
  const IPLocationDataSource(this._client);

  @override
  Future<LocationDTO?> getLocation() async {
    final location = await _client.get('http://ip-api.com/json/');
    return LocationDTO.fromMap(location);
  }
}
