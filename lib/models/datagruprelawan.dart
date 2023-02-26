import 'package:json_annotation/json_annotation.dart';
part 'datagruprelawan.g.dart';

@JsonSerializable()
class DataGruprelawan {
  int? id;
  String? nama_grup;
  String? alamat_posko;
  String? email;

  DataGruprelawan({this.id, this.nama_grup, this.alamat_posko, this.email});

  factory DataGruprelawan.fromJson(Map<String, dynamic> data) =>
      _$DataGruprelawanFromJson(data);

  Map<String, dynamic> toJson() => _$DataGruprelawanToJson(this);
}
