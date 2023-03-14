import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pilkada/models/Tps.dart';
import 'package:pilkada/services/AuthService.dart';

part 'datatps_event.dart';
part 'datatps_state.dart';

class DatatpsBloc extends Bloc<DatatpsEvent, DatatpsState> {
  DatatpsBloc({Authentication? auth}) : super(DatatpsInitial()) {
    auth = Authentication();
    List<Datatps>? data = [];
    List<Datatps>? foundusers = [];
    List<String> listprovinsi = [];
    List<String> listkabupaten = [];
    List<String> listkecamatan = [];
    kedaerahlist() async {
      var dataprovinsi = await auth!.getdataprovinsi();
      var datakabupaten = await auth.getdatakabupaten();
      var datakecamatan = await auth.getdatakecamatan();
      listprovinsi = [
        for (var x in data!)
          dataprovinsi!
              .firstWhere((e) => e.id.toString() == x.Province_id.toString())
              .name
              .toString()
      ];
      listkabupaten = [
        for (var x in data!)
          datakabupaten!
              .firstWhere((e) => e.id.toString() == x.regency_id.toString())
              .name
              .toString()
      ];
      listkecamatan = [
        for (var x in data!)
          datakecamatan!
              .firstWhere((e) => e.id.toString() == x.district_id.toString())
              .name
              .toString()
      ];
    }

    on<DatatpsEvent>((event, emit) async {
      if (event is Datatpsconnect) {
        data = await auth!.getdatatps(page: event.page);
        await kedaerahlist();
        foundusers = data;
        emit(DatatpsLoaded(
            data: foundusers,
            provinsi: listprovinsi,
            kabupaten: listkabupaten,
            kecamatan: listkecamatan));
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

      if (event is DatatpsSearchProvinsi) {
        List<Datatps> results = [];

        if (event.provinsi!.isEmpty) {
          results = data!;
          await kedaerahlist();
        } else {
          results = data!
              .where((e) => e.Province_id!.contains(event.provinsi!))
              .toList();
          await kedaerahlist();
        }
        foundusers = results;
        emit(DatatpsLoaded(
            data: foundusers,
            provinsi: listprovinsi,
            kabupaten: listkabupaten,
            kecamatan: listkecamatan));
      }
      if (event is DatatpsSearchKabupaten) {
        List<Datatps> results = [];

        if (event.kabupaten!.isEmpty) {
          results = data!;
          kedaerahlist();
        } else {
          results = data!
              .where((e) => e.regency_id!.contains(event.kabupaten!))
              .toList();
          kedaerahlist();
        }
        foundusers = results;
        emit(DatatpsLoaded(
            data: foundusers,
            provinsi: listprovinsi,
            kabupaten: listkabupaten,
            kecamatan: listkecamatan));
      }
      if (event is DatatpsSearchKecamatan) {
        List<Datatps> results = [];

        if (event.kecamatan!.isEmpty) {
          results = data!;
          kedaerahlist();
        } else {
          results = data!
              .where((e) => e.district_id!.contains(event.kecamatan!))
              .toList();
          kedaerahlist();
        }
        foundusers = results;
        emit(DatatpsLoaded(
            data: foundusers,
            provinsi: listprovinsi,
            kabupaten: listkabupaten,
            kecamatan: listkecamatan));
      }
    });
  }
}
