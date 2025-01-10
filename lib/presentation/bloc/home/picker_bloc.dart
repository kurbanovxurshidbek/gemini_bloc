import 'package:bloc/bloc.dart';
import 'package:ngdemo29/core/services/log_service.dart';
import 'package:ngdemo29/core/services/utils_service.dart';
import 'package:ngdemo29/presentation/bloc/home/picker_event.dart';
import 'package:ngdemo29/presentation/bloc/home/picker_state.dart';

class PickerBloc extends Bloc<PickerEvent, PickerState> {
  String? pickedImage64;

  PickerBloc() : super(PickerInitialState()) {
    on<SelectedPhotoEvent>(_onSelectedPhotoEvent);
    on<ClearedPhotoEvent>(_onClearedPhotoEvent);
  }

  Future<void> _onSelectedPhotoEvent(SelectedPhotoEvent event, Emitter<PickerState> emit) async {
    var result = await Utils.pickAndConvertImage();
    pickedImage64 = result;
    LogService.i(result);
    emit(SelectedPhotoState());
  }

  Future<void> _onClearedPhotoEvent(ClearedPhotoEvent event, Emitter<PickerState> emit) async {
    pickedImage64 = null;
    emit(ClearedPhotoState());
  }
}
