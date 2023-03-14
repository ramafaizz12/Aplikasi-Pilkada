import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pilkada/models/dataKordinator.dart';
import 'package:pilkada/services/AuthService.dart';

part 'datakoordinator_event.dart';
part 'datakoordinator_state.dart';

class DatakoordinatorBloc
    extends Bloc<DatakoordinatorEvent, DatakoordinatorState> {
  DatakoordinatorBloc({Authentication? auth})
      : super(DatakoordinatorInitial()) {
    auth = Authentication();
    on<DatakoordinatorEvent>((event, emit) async {
      if (event is DataKoordinatorConnect) {
        var dataprovinsi = await auth!.getdataprovinsi();
        var datakabupaten = await auth.getdatakabupaten();
        var data = await auth.getdatakordinator(page: event.page);

        var listkabupaten = [
          for (var x in data!)
            datakabupaten!
                .firstWhere((e) => e.id.toString() == x.regency_id.toString())
                .name
                .toString()
        ];
        var listprovinsi = [
          for (var x in data)
            dataprovinsi!
                .firstWhere((e) => e.id.toString() == x.Province_id.toString())
                .name
                .toString()
        ];
        emit(DataKoordinatorLoaded(
            data: data, provinsi: listprovinsi, kabupaten: listkabupaten));
      }
      if (event is TambahDataKoordinator) {
        var data = await auth!.createkoordinator(
          nama_lengkap: event.nama,
          nik: event.nik,
          tempat_lahir: event.tempat_lahir,
          tanggal_lahir: event.tanggal_lahir,
          jkl: event.jkl,
          agama: event.agama,
          no_hp: event.no_hp,
          foto: event.foto,
          scan_ktp: event.scan_ktp,
          Province_id: event.Province_id,
          regency_id: event.regency_id,
        );
        emit(DatakoorUpdate(data: data));
      }
    });
  }
}
