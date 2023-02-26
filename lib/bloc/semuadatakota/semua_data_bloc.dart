import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pilkada/models/Kabupaten.dart';
import 'package:pilkada/models/Kecamatan.dart';
import 'package:pilkada/services/AuthService.dart';

import '../../models/Desa.dart';

part 'semua_data_event.dart';
part 'semua_data_state.dart';

class SemuaDataBloc extends Bloc<SemuaDataEvent, SemuaDataState> {
  SemuaDataBloc({Authentication? auth}) : super(SemuaDataInitial()) {
    auth = Authentication();
    on<SemuaDataEvent>((event, emit) async {});
  }
}
