import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pilkada/models/Tps.dart';
import 'package:pilkada/services/AuthService.dart';

part 'datatps_event.dart';
part 'datatps_state.dart';

class DatatpsBloc extends Bloc<DatatpsEvent, DatatpsState> {
  DatatpsBloc({Authentication? auth}) : super(DatatpsInitial()) {
    auth = Authentication();
    on<DatatpsEvent>((event, emit) async {
      if (event is Datatpsconnect) {
        var data = await auth!.getdatatps();
        emit(DatatpsLoaded(data: data));
      }
      if (event is DataTpsNew) {
        var data = await auth!.getdatatps();
        emit(DatatpsLoaded(data: data));
      }

      if (event is TambahDataTps) {
        var data = await auth!.posttps(
            province_id: event.province_id,
            regency_id: event.regency_id,
            district_id: event.district_id,
            tps: event.tps,
            ket: event.ket);
        add(DataTpsNew());
        emit(DatatpsUpdate(update: data));
      }
    });
  }
}
