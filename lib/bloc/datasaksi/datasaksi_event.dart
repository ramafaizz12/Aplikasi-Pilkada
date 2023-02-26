part of 'datasaksi_bloc.dart';

@immutable
abstract class DatasaksiEvent {}

class DatasaksiConnect extends DatasaksiEvent {}

class TambahDatasaksi extends DatasaksiEvent {
  String? nama_saksi;
  String? alamat;
  String? nik;

  String? no_hp;
  String? email;
  File? saksi;

  String? Province_id;
  String? regency_id;
  String? district_id;
  String? tps_id;
  String? role;
  String? password;

  TambahDatasaksi(
      {this.nama_saksi,
      this.alamat,
      this.nik,
      this.no_hp,
      this.email,
      this.saksi,
      this.Province_id,
      this.regency_id,
      this.district_id,
      this.tps_id,
      this.role,
      this.password});
}

class DatasaksiNew extends DatasaksiEvent {}
