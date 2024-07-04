import 'package:location/features/maps/data/datasources/location/geo_location_datasource.dart';
import 'package:location/features/maps/data/datasources/location/ip_location_datasource.dart';
import 'package:location/features/maps/data/repositories/location_repository_impl.dart';
import 'package:location/features/maps/domain/usecases/get_location_usecase.dart';
import 'package:location/features/maps/ui/pages/map_view/map_view_bloc.dart';
import 'package:location/main_binding.dart';
import 'package:location/services/geolocation.dart';

class MapsBinding {
  static void dependencies() {
    getIt
      ..registerFactory(() => GeolocationService())
      ..registerFactory(() => GeoLocationDataSource(getIt()))
      ..registerFactory(() => IPLocationDataSource(getIt()))
      ..registerFactory(() => LocationRepositoryImpl(getIt<GeoLocationDataSource>(), getIt<IPLocationDataSource>()))
      ..registerFactory(() => GetLocationUsecase(getIt<LocationRepositoryImpl>()))
      ..registerLazySingleton(() => MapViewBloc(getIt()));
  }
}
