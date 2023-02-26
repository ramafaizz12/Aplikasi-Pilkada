part of 'datatps_bloc.dart';

@immutable
abstract class DatatpsState {}

class DatatpsInitial extends DatatpsState {}

class DatatpsLoaded extends DatatpsState {
  List<Datatps>? data;

  DatatpsLoaded({this.data});
}

class DatatpsUpdate extends DatatpsState {
  bool? update;

  DatatpsUpdate({this.update});
}
