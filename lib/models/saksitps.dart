import 'package:json_annotation/json_annotation.dart';
part 'saksitps.g.dart';

@JsonSerializable()
class DataSaksi {
  String? nama_saksi;
  String? nik;
  String? alamat;
  String? tps_id;
  String? email;
  String? role;
  String? no_hp;
  String? foto;
  String? saksi;
  String? Province_id;
  String? regency_id;
  String? district_id;

  DataSaksi({
    this.nama_saksi,
    this.nik,
    this.alamat,
    this.no_hp,
    this.foto,
    this.saksi,
    this.Province_id,
    this.regency_id,
    this.district_id,
  });

  factory DataSaksi.fromJson(Map<String, dynamic> data) =>
      _$DataSaksiFromJson(data);

  Map<String, dynamic> toJson() => _$DataSaksiToJson(this);
}
