part of 'datatps_bloc.dart';

@immutable
abstract class DatatpsEvent {}

class Datatpsconnect extends DatatpsEvent {}

class TambahDataTps extends DatatpsEvent {
  String? province_id;
  String? regency_id;
  String? district_id;
  String? tps;
  String? ket;
  TambahDataTps(
      {this.province_id,
      this.regency_id,
      this.district_id,
      this.tps,
      this.ket});
}

class DataTpsNew extends DatatpsEvent {}
