part of 'datadashboard_bloc.dart';

@immutable
abstract class DatadashboardEvent {}

class DatadashboardConnectAdmin extends DatadashboardEvent {}

class DatadashboardConnectCalek extends DatadashboardEvent {}

class DatadashboardConnectKordinator extends DatadashboardEvent {}

class DatadashboardConnectRelawan extends DatadashboardEvent {}

class DatadashboardConnectSaksi extends DatadashboardEvent {}
