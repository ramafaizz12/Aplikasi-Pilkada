part of 'datarelawan_bloc.dart';

@immutable
abstract class DatarelawanState {}

class DatarelawanInitial extends DatarelawanState {}

class DataRelawanLoaded extends DatarelawanState {
  List<DataRelawan>? data;

  DataRelawanLoaded({this.data});
}

class DataRelawanUpdate extends DatarelawanState {
  bool? data;

  DataRelawanUpdate({this.data});
}

class DataGruprelawanLoaded extends DatarelawanState {
  List<DataGruprelawan>? data;

  DataGruprelawanLoaded({this.data});
}
