import 'package:json_annotation/json_annotation.dart';
part 'Datadpt.g.dart';

@JsonSerializable()
class Datadpt {
  String? nama;
  String? nik;
  String? tempat_lahir;
  String? tanggal_lahir;
  String? jkl;
  String? agama;
  String? no_hp;
  String? email;
  String? foto;
  String? scan_ktp;
  String? Province_id;
  String? regency_id;
  String? district_id;

  Datadpt(
      {this.nama,
      this.nik,
      this.tempat_lahir,
      this.tanggal_lahir,
      this.jkl,
      this.agama,
      this.no_hp,
      this.email,
      this.foto,
      this.scan_ktp,
      this.Province_id,
      this.regency_id,
      this.district_id});

  factory Datadpt.fromJson(Map<String, dynamic> data) =>
      _$DatadptFromJson(data);

  Map<String, dynamic> toJson() => _$DatadptToJson(this);
}
