# Location CloudWalk

This project is part of the selection process of CloudWalk. It's a simple app to retrieve the current location of the user.

### Requirements

- Flutter
- Google Maps API KEY

### Instalação

To run the project is necessary create a `.env` file and add an valid `MAPS_API_KEY`, you can use the `.env.example` file as an example.
After add this, just run `flutter pub get`, then `flutter run`.

## Cobertura de Testes

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

For a better view and interaction with the code coverage please open the file `/coverage/html/index.html` in your browser.