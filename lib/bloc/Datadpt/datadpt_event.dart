part of 'datadpt_bloc.dart';

@immutable
abstract class DatadptEvent {}

class Datadptconnect extends DatadptEvent {}

class DatadptSearchProvinsi extends DatadptEvent {
  String? value;

  DatadptSearchProvinsi({this.value});
}

class DatadptSearchKabupaten extends DatadptEvent {
  String? value;

  DatadptSearchKabupaten({this.value});
}

class DatadptSearchKecamatan extends DatadptEvent {
  String? value;

  DatadptSearchKecamatan({this.value});
}

class DatadptSearchnama extends DatadptEvent {
  String? value;

  DatadptSearchnama({this.value});
}
