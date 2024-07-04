import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter_platform_interface/src/platform_interface/google_maps_flutter_platform.dart';
import 'package:location/features/maps/domain/entities/location.dart';
import 'package:location/features/maps/ui/pages/map_view/map_view_bloc.dart';
import 'package:location/features/maps/ui/pages/map_view/map_view_page.dart';
import 'package:location/main_binding.dart';
import 'package:location/utils/base_state.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../test_utils/fake_google_maps_flutter_platform.dart';

class MapViewBlocMock extends Mock implements MapViewBloc {}

void main() {
  late FakeGoogleMapsFlutterPlatform platform;
  late MapViewBloc bloc;

  setUpAll(() {
    platform = FakeGoogleMapsFlutterPlatform();
    GoogleMapsFlutterPlatform.instance = platform;

    bloc = MapViewBlocMock();
    getIt.registerSingleton(bloc);

    when(() => bloc.getLocation()).thenAnswer((_) async {});
  });
  group('[UI] - MapViewPage', () {
    testWidgets('EmptyState', (tester) async {
      whenListen(
        bloc,
        Stream<BaseState>.fromIterable([const EmptyState()]),
        initialState: const EmptyState(),
      );

      await tester.pumpWidget(const MaterialApp(home: MapViewPage()));

      expect(find.text('Map View'), findsOneWidget);
      expect(find.byType(GoogleMap), findsOneWidget);
      expect(find.byType(Icon), findsOneWidget);
    });
    testWidgets('LoadingState', (tester) async {
      whenListen(
        bloc,
        Stream<BaseState>.fromIterable([const LoadingState()]),
        initialState: const EmptyState(),
      );

      await tester.pumpWidget(const MaterialApp(home: MapViewPage()));

      await tester.pump();

      expect(find.text('Map View'), findsOneWidget);
      expect(find.byType(GoogleMap), findsOneWidget);
      expectLater(find.byType(CircularProgressIndicator), findsOneWidget);
    });
    testWidgets('SuccessState', (tester) async {
      whenListen(
        bloc,
        Stream<BaseState>.fromIterable([
          const LoadingState(),
          const SuccessState<Location?>(Location(latitude: 10, longitude: 10)),
        ]),
        initialState: const EmptyState(),
      );

      await tester.pumpWidget(const MaterialApp(home: MapViewPage()));

      await tester.pumpAndSettle(const Duration(seconds: 3));

      final PlatformMapStateRecorder map = platform.lastCreatedMap;

      expect(find.text('Map View'), findsOneWidget);
      expect(find.byType(GoogleMap), findsOneWidget);
      expect(find.byType(Icon), findsOneWidget);
      expect(map.widgetConfiguration.initialCameraPosition, const CameraPosition(target: LatLng(0, 0), zoom: 15));
      expect(map.markerUpdates.last.markersToChange.first.position.latitude, 10);
      expect(map.markerUpdates.last.markersToChange.first.position.longitude, 10);
    });
    testWidgets('ErrorState', (tester) async {
      whenListen(
        bloc,
        Stream<BaseState>.fromIterable([
          const LoadingState(),
          const ErrorState('Error'),
        ]),
        initialState: const EmptyState(),
      );

      await tester.pumpWidget(const MaterialApp(home: MapViewPage()));

      await tester.pumpAndSettle();

      expect(find.text('Map View'), findsOneWidget);
      expect(find.byType(GoogleMap), findsOneWidget);
      expect(find.byType(Icon), findsOneWidget);
      expect(find.text('Error'), findsOneWidget);
    });
    testWidgets('tap button', (widgetTester) async {
      whenListen(
        bloc,
        Stream<BaseState>.fromIterable([const EmptyState()]),
        initialState: const EmptyState(),
      );

      bool tapped = false;

      await widgetTester.pumpWidget(const MaterialApp(home: MapViewPage()));

      when(() => bloc.getLocation()).thenAnswer((_) async {
        tapped = true;
      });

      final button = find.byType(FloatingActionButton);
      expect(button, findsOneWidget);

      await widgetTester.tap(button);

      expect(tapped, true);
    });
  });
}
