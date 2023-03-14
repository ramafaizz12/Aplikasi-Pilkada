part of 'datakoordinator_bloc.dart';

@immutable
abstract class DatakoordinatorState {}

class DatakoordinatorInitial extends DatakoordinatorState {}

class DataKoordinatorLoaded extends DatakoordinatorState {
  List<DataKordinator>? data;
  List<String>? gruprelawan;
  List<String>? provinsi;
  List<String>? kabupaten;

  DataKoordinatorLoaded(
      {this.data, this.gruprelawan, this.provinsi, this.kabupaten});
}

class DatakoorUpdate extends DatakoordinatorState {
  bool? data;

  DatakoorUpdate({this.data});
}
