part of 'semua_data_bloc.dart';

@immutable
abstract class SemuaDataState {}

class SemuaDataInitial extends SemuaDataState {}

class SemuaDataLoaded extends SemuaDataState {
  List<DataKabupaten>? kabupaten;
  List<DataDesa>? desa;
  List<DataKecamatan>? kecamatan;

  SemuaDataLoaded({this.kabupaten, this.desa, this.kecamatan});
}
