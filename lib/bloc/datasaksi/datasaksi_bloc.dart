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
        var dataprovinsi = await auth!.getdataprovinsi();
        var datakabupaten = await auth.getdatakabupaten();
        var datakecamatan = await auth.getdatakecamatan();
        var data = await auth!.getdatasaksi(page: event.page);
        var listprovinsi = [
          for (var x in data!)
            dataprovinsi!
                .firstWhere((e) => e.id.toString() == x.Province_id.toString())
                .name
                .toString()
        ];
        var listkabupaten = [
          for (var x in data!)
            datakabupaten!
                .firstWhere((e) => e.id.toString() == x.regency_id.toString())
                .name
                .toString()
        ];
        var listkecamatan = [
          for (var x in data!)
            datakecamatan!
                .firstWhere((e) => e.id.toString() == x.district_id.toString())
                .name
                .toString()
        ];
        emit(DataSaksiLoaded(
            data: data,
            provinsi: listprovinsi,
            kabupaten: listkabupaten,
            kecamatan: listkecamatan));
      }
      if (event is TambahDatasaksi) {
        try {
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
        } catch (e) {
          print('erroki');
          emit(DatasaksiFailure(error: e.toString()));
        }
      }

      if (event is DatasaksiNew) {
        var data = await auth!.getdatasaksi();
        emit(DataSaksiLoaded(data: data));
      }
    });
  }
}
