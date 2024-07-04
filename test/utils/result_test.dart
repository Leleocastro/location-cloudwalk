import 'package:flutter_test/flutter_test.dart';
import 'package:location/utils/result.dart';

void main() {
  group('Result Tests', () {
    test('Result.success returns success with correct data', () {
      var result = ResultExtension.success('Test Data');
      expect(result.isSuccess, isTrue);
      expect(result.isError, isFalse);
      expect(result.data, 'Test Data');
    });

    test('Result.err returns error with correct message', () {
      var result = ResultExtension.err('Error Message');
      expect(result.isSuccess, isFalse);
      expect(result.isError, isTrue);
      expect(result.error?.message, 'Error Message');
    });

    test('Result.success has no error', () {
      var result = ResultExtension.success(123);
      expect(result.error, isNull);
    });

    test('Result.err has no data', () {
      var result = ResultExtension.err('No Data', errorCode: '404');
      expect(result.data, isNull);
      expect(result.error?.code, '404');
    });
  });
}
