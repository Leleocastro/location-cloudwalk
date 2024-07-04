import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:location/features/maps/maps_binding.dart';
import 'package:location/services/client/http_client.dart';

final getIt = GetIt.instance;

Future<void> initBindings() async {
  getIt
    ..registerSingleton(Dio())
    ..registerSingleton(AppHttpClient(getIt()));
  MapsBinding.dependencies();
}
