import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:location/services/client/http_client.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}

void main() {
  group('AppHttpClient', () {
    final mockDio = MockDio();
    final appHttpClient = AppHttpClient(mockDio);
    setUpAll(() {
      when(() => mockDio.options).thenReturn(BaseOptions());
    });

    test('GET', () async {
      final responsePayload = {'id': 1, 'name': 'Test Item'};
      when(() => mockDio.get<Map<String, dynamic>>(
            any(),
            queryParameters: any(named: 'queryParameters'),
            options: any(named: 'options'),
            cancelToken: any(named: 'cancelToken'),
            onReceiveProgress: any(named: 'onReceiveProgress'),
          )).thenAnswer((_) async => Response<Map<String, dynamic>>(
            data: responsePayload,
            statusCode: 200,
            requestOptions: RequestOptions(path: ''),
          ));

      final result = await appHttpClient.get<Map<String, dynamic>>('test/path', header: {'Authorization': 'Bearer token'});

      expect(result, responsePayload);
    });

    test('GET - Error', () async {
      when(() => mockDio.get<Map<String, dynamic>>(
            any(),
            queryParameters: any(named: 'queryParameters'),
            options: any(named: 'options'),
            cancelToken: any(named: 'cancelToken'),
            onReceiveProgress: any(named: 'onReceiveProgress'),
          )).thenThrow(Exception('Error'));

      expect(() async => await appHttpClient.get<Map<String, dynamic>>('test/path', header: {'Authorization': 'Bearer token'}), throwsException);
    });

    test('POST', () async {
      final responsePayload = {'id': 1, 'name': 'Test Item'};
      when(() => mockDio.post<Map<String, dynamic>>(
            any(),
            data: any(named: 'data'),
            queryParameters: any(named: 'queryParameters'),
            options: any(named: 'options'),
            cancelToken: any(named: 'cancelToken'),
            onSendProgress: any(named: 'onSendProgress'),
            onReceiveProgress: any(named: 'onReceiveProgress'),
          )).thenAnswer((_) async => Response<Map<String, dynamic>>(
            data: responsePayload,
            statusCode: 200,
            requestOptions: RequestOptions(path: ''),
          ));

      final result = await appHttpClient.post<Map<String, dynamic>>('test/path', header: {'Authorization': 'Bearer token'});

      expect(result, responsePayload);
    });

    test('POST - Error', () async {
      when(() => mockDio.post<Map<String, dynamic>>(
            any(),
            data: any(named: 'data'),
            queryParameters: any(named: 'queryParameters'),
            options: any(named: 'options'),
            cancelToken: any(named: 'cancelToken'),
            onSendProgress: any(named: 'onSendProgress'),
            onReceiveProgress: any(named: 'onReceiveProgress'),
          )).thenThrow(Exception('Error'));

      expect(() async => await appHttpClient.post<Map<String, dynamic>>('test/path', header: {'Authorization': 'Bearer token'}), throwsException);
    });

    test('PUT', () async {
      final responsePayload = {'id': 1, 'name': 'Test Item'};
      when(() => mockDio.put<Map<String, dynamic>>(
            any(),
            data: any(named: 'data'),
            queryParameters: any(named: 'queryParameters'),
            options: any(named: 'options'),
            cancelToken: any(named: 'cancelToken'),
            onSendProgress: any(named: 'onSendProgress'),
            onReceiveProgress: any(named: 'onReceiveProgress'),
          )).thenAnswer((_) async => Response<Map<String, dynamic>>(
            data: responsePayload,
            statusCode: 200,
            requestOptions: RequestOptions(path: ''),
          ));

      final result = await appHttpClient.put<Map<String, dynamic>>('test/path', header: {'Authorization': 'Bearer token'});

      expect(result, responsePayload);
    });

    test('PUT - Error', () async {
      when(() => mockDio.put<Map<String, dynamic>>(
            any(),
            data: any(named: 'data'),
            queryParameters: any(named: 'queryParameters'),
            options: any(named: 'options'),
            cancelToken: any(named: 'cancelToken'),
            onSendProgress: any(named: 'onSendProgress'),
            onReceiveProgress: any(named: 'onReceiveProgress'),
          )).thenThrow(Exception('Error'));

      expect(() async => await appHttpClient.put<Map<String, dynamic>>('test/path', header: {'Authorization': 'Bearer token'}), throwsException);
    });

    test('DELETE', () async {
      final responsePayload = {'id': 1, 'name': 'Test Item'};
      when(() => mockDio.delete<Map<String, dynamic>>(
            any(),
            queryParameters: any(named: 'queryParameters'),
            options: any(named: 'options'),
            cancelToken: any(named: 'cancelToken'),
          )).thenAnswer((_) async => Response<Map<String, dynamic>>(
            data: responsePayload,
            statusCode: 200,
            requestOptions: RequestOptions(path: ''),
          ));

      final result = await appHttpClient.delete<Map<String, dynamic>>('test/path', header: {'Authorization': 'Bearer token'});

      expect(result, responsePayload);
    });

    test('DELETE - Error', () async {
      when(() => mockDio.delete<Map<String, dynamic>>(
            any(),
            queryParameters: any(named: 'queryParameters'),
            options: any(named: 'options'),
            cancelToken: any(named: 'cancelToken'),
          )).thenThrow(Exception('Error'));

      expect(() async => await appHttpClient.delete<Map<String, dynamic>>('test/path', header: {'Authorization': 'Bearer token'}), throwsException);
    });

    test('PATCH', () async {
      final responsePayload = {'id': 1, 'name': 'Test Item'};
      when(() => mockDio.patch<Map<String, dynamic>>(
            any(),
            data: any(named: 'data'),
            queryParameters: any(named: 'queryParameters'),
            options: any(named: 'options'),
            cancelToken: any(named: 'cancelToken'),
            onSendProgress: any(named: 'onSendProgress'),
            onReceiveProgress: any(named: 'onReceiveProgress'),
          )).thenAnswer((_) async => Response<Map<String, dynamic>>(
            data: responsePayload,
            statusCode: 200,
            requestOptions: RequestOptions(path: ''),
          ));

      final result = await appHttpClient.patch<Map<String, dynamic>>('test/path', header: {'Authorization': 'Bearer token'});

      expect(result, responsePayload);
    });

    test('PATCH - Error', () async {
      when(() => mockDio.patch<Map<String, dynamic>>(
            any(),
            data: any(named: 'data'),
            queryParameters: any(named: 'queryParameters'),
            options: any(named: 'options'),
            cancelToken: any(named: 'cancelToken'),
            onSendProgress: any(named: 'onSendProgress'),
            onReceiveProgress: any(named: 'onReceiveProgress'),
          )).thenThrow(Exception('Error'));

      expect(() async => await appHttpClient.patch<Map<String, dynamic>>('test/path'), throwsException);
    });
  });
}
