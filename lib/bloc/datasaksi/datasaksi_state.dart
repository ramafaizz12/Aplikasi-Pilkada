part of 'datasaksi_bloc.dart';

@immutable
abstract class DatasaksiState {}

class DatasaksiInitial extends DatasaksiState {}

class DataSaksiLoaded extends DatasaksiState {
  List<DataSaksi>? data;

  DataSaksiLoaded({this.data});
}

class DatasaksiUpdate extends DatasaksiState {
  bool? update;

  DatasaksiUpdate({this.update});
}
