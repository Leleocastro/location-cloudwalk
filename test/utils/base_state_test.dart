import 'package:flutter_test/flutter_test.dart';
import 'package:location/utils/base_state.dart';

void main() {
  group('BaseState Tests', () {
    test('LoadingState Test', () {
      const state = LoadingState();
      expect(state.props, isEmpty);
      expect(state.stringify, isFalse);
    });

    test('SuccessState Test', () {
      const data = 'Test Data';
      const state = SuccessState(data);
      expect(state.props, contains(data));
      expect(state.stringify, isFalse);
    });

    test('ErrorState Test', () {
      const message = 'Error occurred';
      const errorCode = '404';
      const state = ErrorState(message, errorCode);
      expect(state.props, containsAll([message, errorCode]));
      expect(state.stringify, isFalse);
    });

    test('EmptyState Test', () {
      const message = 'No data';
      const state = EmptyState(message: message);
      expect(state.props, isEmpty);
      expect(state.stringify, isFalse);
    });
  });
}
