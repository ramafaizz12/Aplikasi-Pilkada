import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/Datadpt.dart';
import '../../services/AuthService.dart';

part 'datadpt_event.dart';
part 'datadpt_state.dart';

class DatadptBloc extends Bloc<DatadptEvent, DatadptState> {
  DatadptBloc({Authentication? auth}) : super(DatadptInitial()) {
    auth = Authentication();
    on<DatadptEvent>((event, emit) async {
      if (event is Datadptconnect) {
        var data = await auth!.getdatadpt();
        emit(DatadptLoaded(data: data));
      }
    });
  }
}
