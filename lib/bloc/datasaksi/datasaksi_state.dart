part of 'datasaksi_bloc.dart';

@immutable
abstract class DatasaksiState {}

class DatasaksiInitial extends DatasaksiState {}

class DataSaksiLoaded extends DatasaksiState {
  List<DataSaksi>? data;
  List<String>? provinsi;
  List<String>? kabupaten;
  List<String>? kecamatan;

  DataSaksiLoaded({this.data, this.provinsi, this.kabupaten, this.kecamatan});
}

class DatasaksiUpdate extends DatasaksiState {
  bool? update;

  DatasaksiUpdate({this.update});
}

class DatasaksiFailure extends DatasaksiState {
  String? error;

  DatasaksiFailure({this.error});
}
