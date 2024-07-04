import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:location/features/maps/data/datasources/location/ip_location_datasource.dart';
import 'package:location/services/client/http_client.dart';
import 'package:mocktail/mocktail.dart';

class AppHttpClientMock extends Mock implements AppHttpClient {}

void main() {
  const requestResponse = {
    "query": "179.252.95.93",
    "status": "success",
    "country": "Brazil",
    "countryCode": "BR",
    "region": "DF",
    "regionName": "Federal District",
    "city": "Brasília",
    "zip": "70640",
    "lat": -15.7792,
    "lon": -47.9341,
    "timezone": "America/Sao_Paulo",
    "isp": "V tal",
    "org": "V tal",
    "as": "AS8167 V tal"
  };

  late AppHttpClient client;
  late IPLocationDataSource ipLocationDataSource;
  setUp(() {
    client = AppHttpClientMock();
    ipLocationDataSource = IPLocationDataSource(client);
  });

  group('[DATA] - IPLocationDataSource', () {
    test('When thrown an error from request', () async {
      when(() => client.get(any())).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: ''),
          error: 'Error',
          response: Response(
            requestOptions: RequestOptions(path: ''),
            data: 'Error',
            statusCode: 500,
            statusMessage: 'Error',
          ),
        ),
      );
      try {
        await ipLocationDataSource.getLocation();
      } catch (e) {
        expect(e, isA<DioException>());
      }
    });

    test('When request is successful', () async {
      when(() => client.get(any())).thenAnswer((_) async => requestResponse);
      final result = await ipLocationDataSource.getLocation();
      expect(result, isNotNull);
      expect(result!.latitude, -15.7792);
      expect(result.longitude, -47.9341);
    });
  });
}
