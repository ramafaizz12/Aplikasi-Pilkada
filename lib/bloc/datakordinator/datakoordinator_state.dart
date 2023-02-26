part of 'datakoordinator_bloc.dart';

@immutable
abstract class DatakoordinatorState {}

class DatakoordinatorInitial extends DatakoordinatorState {}

class DataKoordinatorLoaded extends DatakoordinatorState {
  List<DataKordinator>? data;

  DataKoordinatorLoaded({this.data});
}

class DatakoorUpdate extends DatakoordinatorState {
  bool? data;

  DatakoorUpdate({this.data});
}
