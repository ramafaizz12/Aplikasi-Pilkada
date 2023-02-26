import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pilkada/models/dataaksesoris.dart';

import '../../services/AuthService.dart';

part 'dataaksesoris_event.dart';
part 'dataaksesoris_state.dart';

class DataaksesorisBloc extends Bloc<DataaksesorisEvent, DataaksesorisState> {
  DataaksesorisBloc({Authentication? auth}) : super(DataaksesorisInitial()) {
    auth = Authentication();
    on<DataaksesorisEvent>((event, emit) async {
      if (event is DataaksesorisConnect) {
        var data = await auth!.getdataaksesoris();
        emit(Dataaksesorisloaded(data: data));
      }
    });
  }
}
