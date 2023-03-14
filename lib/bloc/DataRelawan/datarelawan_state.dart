part of 'datarelawan_bloc.dart';

@immutable
abstract class DatarelawanState {}

class DatarelawanInitial extends DatarelawanState {}

class DataRelawanLoaded extends DatarelawanState {
  List<DataRelawan>? data;
  List<String>? gruprelawan;
  List<String>? datakabupaten;

  DataRelawanLoaded({this.data, this.gruprelawan, this.datakabupaten});
}

class DataRelawanUpdate extends DatarelawanState {
  bool? data;

  DataRelawanUpdate({this.data});
}

class DataGruprelawanLoaded extends DatarelawanState {
  List<DataGruprelawan>? data;

  DataGruprelawanLoaded({this.data});
}
