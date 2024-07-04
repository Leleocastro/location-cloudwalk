import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:location/features/maps/data/datasources/location/geo_location_datasource.dart';
import 'package:location/features/maps/data/datasources/location/ip_location_datasource.dart';
import 'package:location/features/maps/data/repositories/location_repository_impl.dart';
import 'package:location/features/maps/domain/usecases/get_location_usecase.dart';
import 'package:location/features/maps/ui/pages/map_view/map_view_bloc.dart';
import 'package:location/main_binding.dart';
import 'package:location/services/client/http_client.dart';
import 'package:location/services/geolocation.dart';

void main() {
  test('Should register all the dependencies on GetIt', () async {
    await initBindings();

    expect(getIt.isRegistered<Dio>(), true);
    expect(getIt.isRegistered<AppHttpClient>(), true);
    expect(getIt.isRegistered<GeolocationService>(), true);
    expect(getIt.isRegistered<GeoLocationDataSource>(), true);
    expect(getIt.isRegistered<IPLocationDataSource>(), true);
    expect(getIt.isRegistered<LocationRepositoryImpl>(), true);
    expect(getIt.isRegistered<GetLocationUsecase>(), true);
    expect(getIt.isRegistered<MapViewBloc>(), true);
  });
}
