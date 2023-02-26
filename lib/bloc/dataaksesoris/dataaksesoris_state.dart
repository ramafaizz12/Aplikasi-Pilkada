part of 'dataaksesoris_bloc.dart';

@immutable
abstract class DataaksesorisState {}

class DataaksesorisInitial extends DataaksesorisState {}

class Dataaksesorisloaded extends DataaksesorisState {
  List<Dataaksesoris>? data;

  Dataaksesorisloaded({this.data});
}
