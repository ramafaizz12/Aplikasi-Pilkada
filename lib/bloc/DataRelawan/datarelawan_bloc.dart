import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pilkada/models/datagruprelawan.dart';
import 'package:pilkada/models/datarelawan.dart';
import 'package:pilkada/services/AuthService.dart';

part 'datarelawan_event.dart';
part 'datarelawan_state.dart';

class DatarelawanBloc extends Bloc<DatarelawanEvent, DatarelawanState> {
  DatarelawanBloc({Authentication? auth}) : super(DatarelawanInitial()) {
    auth = Authentication();
    on<DatarelawanEvent>((event, emit) async {
      if (event is DataRelawanConnect) {
        var data = await auth!.getdatarelawan();
        emit(DataRelawanLoaded(data: data));
      }
      if (event is DataRelawanNew) {
        var data = await auth!.getdatarelawan();
        emit(DataRelawanLoaded(data: data));
      }

      if (event is TambahDataRelawan) {
        var data = await auth!.createrelawan(
            nama: event.nama,
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
            gruprelawan_id: event.gruprelawan_id);
        add(DataRelawanNew());
        emit(DataRelawanUpdate(data: data));
      }

      if (event is GrupRelawanConnect) {
        var data = await auth!.getdatagruprelawan();
        emit(DataGruprelawanLoaded(data: data));
      }
    });
  }
}
