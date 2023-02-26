part of 'semua_data_bloc.dart';

@immutable
abstract class SemuaDataEvent {}

class SemuaDataConnectKabupaten extends SemuaDataEvent {}

class SemuaDataConnectKecamatan extends SemuaDataEvent {}

class SemuaDataConnectDesa extends SemuaDataEvent {}
