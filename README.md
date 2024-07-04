# Location CloudWalk

This project is part of the selection process challenge of CloudWalk. It's a simple app to retrieve the current location of the user, as required on this [CHALLENGE](https://t.lever-analytics.com/email-link?dest=https%3A%2F%2Fgist.github.com%2Fcloudwalk-tests%2F0945f56177d3498d38cd9002d96fda4f&eid=1f7cd724-8ef4-476b-9502-abd5392a2c37&idx=2&token=pn02_ZmyKa6tSIAHeZg1sJeVCng).

### Requirements

- Flutter
- Google Maps API KEY

### Instalation

To run the project is necessary create a `.env` file and add an valid `MAPS_API_KEY`, you can use the `.env.example` file as an example.
After add this, just run `flutter pub get`, then `flutter run`.

## Built with

- [BLOC] - State management
- [DIO] - Http request
- [GET_IT] - Dependency Injection
- [GEOLOCATOR] - Retrieve GPS Location
- [GOOGLE_MAPS_FLUTTER] - Map view

## Architecture

The architecture chosen was the Clean Architecture, having a great separation of layers.

![](https://blog.codemagic.io/uploads/2023/03/clean-architecture-explored/clean_architecture_flutter_reso_coder.webp)

## Tests Coverage

The app is with a test coverage of 100%, for more information look below:

---------------------------------------------|---------|---------|---------|-------------------|
File                                         |% Branch | % Funcs | % Lines | Uncovered Line #s |
---------------------------------------------|---------|---------|---------|-------------------|
lib/                                         |         |         |         |                   |
 main.dart                                   |    0.00 |    0.00 |    0.00 |    no unit testing|
 main_binding.dart                           |  100.00 |  100.00 |  100.00 |                   |
lib/features/maps/                           |         |         |         |                   |
 maps_binding.dart                           |  100.00 |  100.00 |  100.00 |                   |
lib/features/maps/data/datasources/location/ |         |         |         |                   |
 geo_location_datasource.dart                |  100.00 |  100.00 |  100.00 |                   |
 ip_location_datasource.dart                 |  100.00 |  100.00 |  100.00 |                   |
 location_datasource.dart                    |    0.00 |    0.00 |    0.00 |    no unit testing|
lib/features/maps/data/models/               |         |         |         |                   |
 location_dto.dart                           |  100.00 |  100.00 |  100.00 |                   |
lib/features/maps/data/repositories/         |         |         |         |                   |
 location_repository_impl.dart               |  100.00 |  100.00 |  100.00 |                   |
lib/features/maps/domain/entities/           |         |         |         |                   |
 location.dart                               |  100.00 |  100.00 |  100.00 |                   |
lib/features/maps/domain/repositories/       |         |         |         |                   |
 location_repository.dart                    |    0.00 |    0.00 |    0.00 |    no unit testing|
lib/features/maps/domain/usecases/           |         |         |         |                   |
 get_location_usecase.dart                   |  100.00 |  100.00 |  100.00 |                   |
lib/features/maps/ui/pages/map_view/         |         |         |         |                   |
 map_view_bloc.dart                          |  100.00 |  100.00 |  100.00 |                   |
 map_view_page.dart                          |  100.00 |  100.00 |  100.00 |                   |
lib/services/                                |         |         |         |                   |
 geolocation.dart                            |  100.00 |  100.00 |  100.00 |                   |
lib/services/client/                         |         |         |         |                   |
 http_client.dart                            |  100.00 |  100.00 |  100.00 |                   |
lib/utils/                                   |         |         |         |                   |
 base_state.dart                             |  100.00 |  100.00 |  100.00 |                   |
 result.dart                                 |  100.00 |  100.00 |  100.00 |                   |
---------------------------------------------|---------|---------|---------|-------------------|
 All files with unit testing                 |  100.00 |  100.00 |  100.00 |                   |
---------------------------------------------|---------|---------|---------|-------------------|

![](https://codecov.io/github/Leleocastro/location-cloudwalk/graphs/icicle.svg?token=JENZNP304D)
[![codecov](https://codecov.io/github/Leleocastro/location-cloudwalk/graph/badge.svg?token=JENZNP304D)](https://codecov.io/github/Leleocastro/location-cloudwalk)

For a better view and interaction with the code coverage please open the file `/coverage/html/index.html` in your browser or access [this link](https://app.codecov.io/github/Leleocastro/location-cloudwalk).