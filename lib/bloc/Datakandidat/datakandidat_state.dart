part of 'datakandidat_bloc.dart';

@immutable
abstract class DatakandidatState {}

class DatakandidatInitial extends DatakandidatState {}

class DataKandidatLoaded extends DatakandidatState {
  List<DataKandidat>? data;

  DataKandidatLoaded({this.data});
}

class DatakandidatUpdate extends DatakandidatState {
  bool? update;

  DatakandidatUpdate({this.update});
}
