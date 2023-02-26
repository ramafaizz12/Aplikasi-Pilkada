part of 'datarelawan_bloc.dart';

@immutable
abstract class DatarelawanEvent {}

class DataRelawanConnect extends DatarelawanEvent {}

class TambahDataRelawan extends DatarelawanEvent {
  String? nama;
  String? nik;
  String? tempat_lahir;
  String? tanggal_lahir;
  String? jkl;
  String? agama;
  File? scan_ktp;
  String? no_hp;

  File? foto;

  String? Province_id;
  String? regency_id;

  String? gruprelawan_id;

  TambahDataRelawan(
      {this.nama,
      this.nik,
      this.tempat_lahir,
      this.tanggal_lahir,
      this.jkl,
      this.agama,
      this.no_hp,
      this.scan_ktp,
      this.foto,
      this.Province_id,
      this.regency_id,
      this.gruprelawan_id});
}

class GrupRelawanConnect extends DatarelawanEvent {}

class DataRelawanNew extends DatarelawanEvent {}
