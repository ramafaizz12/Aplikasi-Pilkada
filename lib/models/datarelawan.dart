import 'package:json_annotation/json_annotation.dart';
part 'datarelawan.g.dart';

@JsonSerializable()
class DataRelawan {
  int? id;
  String? nama;
  String? nik;
  String? tempat_lahir;
  String? tanggal_lahir;
  String? jkl;
  String? agama;
  String? suku;
  String? keterangan;
  String? alamat;
  String? rt;
  String? rw;
  String? no_hp;
  String? email;
  String? foto;
  String? scan_ktp;
  String? Province_id;
  String? regency_id;
  String? district_id;
  String? kordinator_id;
  String? gruprelawan_id;

  DataRelawan(
      {this.id,
      this.nama,
      this.nik,
      this.tempat_lahir,
      this.tanggal_lahir,
      this.jkl,
      this.agama,
      this.suku,
      this.keterangan,
      this.alamat,
      this.rt,
      this.rw,
      this.no_hp,
      this.email,
      this.foto,
      this.scan_ktp,
      this.Province_id,
      this.regency_id,
      this.district_id,
      this.kordinator_id,
      this.gruprelawan_id});

  factory DataRelawan.fromJson(Map<String, dynamic> data) =>
      _$DataRelawanFromJson(data);

  Map<String, dynamic> toJson() => _$DataRelawanToJson(this);
}
