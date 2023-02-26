part of 'dataprofile_bloc.dart';

@immutable
abstract class DataprofileState {}

class DataprofileInitial extends DataprofileState {}

class DataprofileLoaded extends DataprofileState {
  DataProfile? data;

  DataprofileLoaded({this.data});
}
