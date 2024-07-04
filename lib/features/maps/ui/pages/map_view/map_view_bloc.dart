import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/features/maps/domain/usecases/get_location_usecase.dart';
import 'package:location/utils/base_state.dart';
import 'package:location/utils/result.dart';

class MapViewBloc extends Cubit<BaseState> {
  final GetLocationUsecase _usecase;
  MapViewBloc(this._usecase) : super(const EmptyState());

  Future<void> getLocation() async {
    emit(const LoadingState());
    final result = await _usecase();
    if (result.isSuccess) {
      emit(SuccessState(result.data));
      return;
    }

    emit(ErrorState(result.error?.message ?? 'Failed to get location'));
  }
}
