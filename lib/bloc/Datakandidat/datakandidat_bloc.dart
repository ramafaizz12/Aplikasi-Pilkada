import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/datakandidat.dart';
import '../../services/AuthService.dart';

part 'datakandidat_event.dart';
part 'datakandidat_state.dart';

class DatakandidatBloc extends Bloc<DatakandidatEvent, DatakandidatState> {
  DatakandidatBloc({Authentication? auth}) : super(DatakandidatInitial()) {
    auth = Authentication();
    on<DatakandidatEvent>((event, emit) async {
      if (event is DataKandidatConnect) {
        var data = await auth!.getdatakandidat();
        emit(DataKandidatLoaded(data: data));
      }

      if (event is TambahDataKandidat) {
        var data = await auth!.createkandidat(
            no_kandidat: event.no_kandidat,
            nama_kandidat: event.nama_kandidat,
            nama_wakil: event.nama_wakil,
            visi_misi: event.visi_misi,
            program: event.program,
            foto: event.foto);
        add(DataKandidatNew());
        emit(DatakandidatUpdate(update: data));
      }
      if (event is DataKandidatNew) {
        var data = await auth!.getdatakandidat();
        emit(DataKandidatLoaded(data: data));
      }
    });
  }
}
