import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:location/features/maps/domain/entities/location.dart';
import 'package:location/features/maps/domain/usecases/get_location_usecase.dart';
import 'package:location/features/maps/ui/pages/map_view/map_view_bloc.dart';
import 'package:location/utils/base_state.dart';
import 'package:location/utils/result.dart';
import 'package:mocktail/mocktail.dart';

class GetLocationUsecaseMock extends Mock implements GetLocationUsecase {}

void main() {
  const location = Location(latitude: 0, longitude: 0);

  late GetLocationUsecase usecase;
  late MapViewBloc bloc;
  setUp(() {
    usecase = GetLocationUsecaseMock();
    bloc = MapViewBloc(usecase);
  });
  group('[UI] - MapViewBloc', () {
    blocTest(
      'When GetLocationUsecase returns the location',
      build: () {
        when(() => usecase()).thenAnswer((_) async => (data: location, error: null));
        return bloc;
      },
      act: (bloc) => bloc.getLocation(),
      expect: () {
        return <Matcher>[
          isA<LoadingState>(),
          isA<SuccessState<Location?>>(),
        ];
      },
    );

    blocTest(
      'When GetLocationUsecase returns an error',
      build: () {
        when(() => usecase()).thenAnswer((_) async => (data: null, error: ResultError('Failed to get location')));
        return bloc;
      },
      act: (bloc) => bloc.getLocation(),
      expect: () {
        return <Matcher>[
          isA<LoadingState>(),
          isA<ErrorState>(),
        ];
      },
    );
  });
}
