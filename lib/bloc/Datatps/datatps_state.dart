part of 'datatps_bloc.dart';

@immutable
abstract class DatatpsState {}

class DatatpsInitial extends DatatpsState {}

class DatatpsLoaded extends DatatpsState {
  List<Datatps>? data;
  List<String>? provinsi;
  List<String>? kabupaten;
  List<String>? kecamatan;

  DatatpsLoaded({this.data, this.provinsi, this.kabupaten, this.kecamatan});
}

class DatatpsUpdate extends DatatpsState {
  bool? update;

  DatatpsUpdate({this.update});
}
