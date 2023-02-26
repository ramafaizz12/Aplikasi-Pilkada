part of 'datadpt_bloc.dart';

@immutable
abstract class DatadptState {}

class DatadptInitial extends DatadptState {}

class DatadptLoaded extends DatadptState {
  List<Datadpt>? data;

  DatadptLoaded({this.data});
}
