part of 'datadashboard_bloc.dart';

@immutable
abstract class DatadashboardState {}

class DatadashboardInitial extends DatadashboardState {}

class DataDashboardLoaded extends DatadashboardState {
  Datadashboard? data;

  DataDashboardLoaded({this.data});
}
