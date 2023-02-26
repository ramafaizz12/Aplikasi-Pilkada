import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pilkada/services/AuthService.dart';

import '../../models/saksitps.dart';

part 'datasaksi_event.dart';
part 'datasaksi_state.dart';

class DatasaksiBloc extends Bloc<DatasaksiEvent, DatasaksiState> {
  DatasaksiBloc({Authentication? auth}) : super(DatasaksiInitial()) {
    auth = Authentication();
    on<DatasaksiEvent>((event, emit) async {
      if (event is DatasaksiConnect) {
        var data = await auth!.getdatasaksi();
        emit(DataSaksiLoaded(data: data));
      }
      if (event is TambahDatasaksi) {
        var data = await auth!.createsaksi(
            nama_saksi: event.nama_saksi,
            nik: event.nik,
            alamat: event.alamat,
            no_hp: event.no_hp,
            email: event.email,
            saksi: event.saksi,
            Province_id: event.Province_id,
            regency_id: event.regency_id,
            district_id: event.district_id,
            tps_id: event.tps_id,
            role: event.role,
            password: event.password);
        add(DatasaksiNew());
        emit(DatasaksiUpdate(update: data));
      }

      if (event is DatasaksiNew) {
        var data = await auth!.getdatasaksi();
        emit(DataSaksiLoaded(data: data));
      }
    });
  }
}
