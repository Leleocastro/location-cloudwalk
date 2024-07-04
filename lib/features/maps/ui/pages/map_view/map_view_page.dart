import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/features/maps/domain/entities/location.dart';
import 'package:location/features/maps/ui/pages/map_view/map_view_bloc.dart';
import 'package:location/main_binding.dart';
import 'package:location/utils/base_state.dart';

class MapViewPage extends StatefulWidget {
  const MapViewPage({super.key});

  @override
  State<MapViewPage> createState() => _MapViewPageState();
}

class _MapViewPageState extends State<MapViewPage> {
  late GoogleMapController mapController;
  late final MapViewBloc _bloc;
  LatLng latLng = const LatLng(0, 0);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    _bloc = getIt<MapViewBloc>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _bloc.getLocation();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MapViewBloc, BaseState>(
      bloc: _bloc,
      listener: (context, state) {
        if (state is ErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }

        if (state is SuccessState<Location?>) {
          final location = state.data;
          mapController.animateCamera(
            CameraUpdate.newLatLng(
              LatLng(location?.latitude ?? 0, location?.longitude ?? 0),
            ),
          );
          mapController.showMarkerInfoWindow(const MarkerId('MyLocation'));
        }
      },
      builder: (context, state) {
        final loading = state is LoadingState;

        if (state is SuccessState<Location?>) {
          final location = state.data;
          latLng = LatLng(
            location?.latitude ?? 0,
            location?.longitude ?? 0,
          );
        }
        return Scaffold(
          appBar: AppBar(
            title: const Text('Map View'),
          ),
          body: GoogleMap(
            onMapCreated: _onMapCreated,
            zoomControlsEnabled: false,
            initialCameraPosition: CameraPosition(
              target: latLng,
              zoom: 15.0,
            ),
            myLocationEnabled: false,
            myLocationButtonEnabled: false,
            markers: {
              Marker(
                markerId: const MarkerId('MyLocation'),
                position: latLng,
                icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
                infoWindow: const InfoWindow(
                  title: 'You',
                ),
              ),
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: loading
                ? null
                : () {
                    _bloc.getLocation();
                  },
            child: loading
                ? const Padding(
                    padding: EdgeInsets.all(15),
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  )
                : const Icon(
                    Icons.my_location,
                  ),
          ),
        );
      },
    );
  }
}
