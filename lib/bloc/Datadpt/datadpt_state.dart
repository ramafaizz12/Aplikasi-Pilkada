part of 'datadpt_bloc.dart';

@immutable
abstract class DatadptState {}

class DatadptInitial extends DatadptState {}

class DatadptLoaded extends DatadptState {
  List<Datadpt>? data;
  List<String>? dataprovinsi;
  List<String>? datakabupaten;
  List<String>? datakecamatan;

  DatadptLoaded(
      {this.data, this.dataprovinsi, this.datakabupaten, this.datakecamatan});
}
