# Location CloudWalk

Location CloudWalk is a simple app designed to retrieve and display the current location of the user using Google Maps. This project is part of the selection process challenge of CloudWalk, as required on this [CHALLENGE](https://t.lever-analytics.com/email-link?dest=https%3A%2F%2Fgist.github.com%2Fcloudwalk-tests%2F0945f56177d3498d38cd9002d96fda4f&eid=1f7cd724-8ef4-476b-9502-abd5392a2c37&idx=2&token=pn02_ZmyKa6tSIAHeZg1sJeVCng).

### Requirements

- Flutter
- Google Maps API KEY

### Instalation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/location-cloudwalk.git
   cd location-cloudwalk
    ```

2. Create a .env file and add a valid MAPS_API_KEY:
    ```bash
    cp .env.example .env
    # Open .env and add your valid MAPS_API_KEY
    ```
3. Install the dependencies:
    ```bash
    flutter pub get
    ```

4. Run the app:
    ```bash
    flutter run
    ```


To run the project is necessary create a `.env` file and add an valid `MAPS_API_KEY`, you can use the `.env.example` file as an example.
After add this, just run `flutter pub get`, then `flutter run`.

## Built with

- [BLOC](https://pub.dev/packages/flutter_bloc) - State management
- [DIO](https://pub.dev/packages/dio) - Http request
- [GET_IT](https://pub.dev/packages/get_it) - Dependency Injection
- [GEOLOCATOR](https://pub.dev/packages/geolocator) - Retrieve GPS Location
- [GOOGLE_MAPS_FLUTTER](https://pub.dev/packages/google_maps_flutter) - Map view

## Architecture

The app follows the principles of Clean Architecture, which ensures a clear separation of concerns and enhances testability and maintainability. The main layers include:

- **Data Layer**: Handles data retrieval from remote and local sources.
- **Domain Layer**: Contains business logic and use cases.
- **Presentation Layer**: Manages UI and state management.

![Clean Architecture](https://blog.codemagic.io/uploads/2023/03/clean-architecture-explored/clean_architecture_flutter_reso_coder.webp)

## Tests Coverage

The app has a test coverage of 100%, ensuring that all critical paths and functionalities are thoroughly tested. Below is the detailed coverage report:

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