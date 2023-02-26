import 'package:json_annotation/json_annotation.dart';
part 'datagedung.g.dart';

@JsonSerializable()
class DataGedung {
  int? id;
  String? type_gedung;
  String? nama_gedung;
  String? updated_at;
  String? created_at;

  DataGedung(
      {this.id,
      this.created_at,
      this.updated_at,
      this.nama_gedung,
      this.type_gedung});

  factory DataGedung.fromJson(Map<String, dynamic> data) =>
      _$DataGedungFromJson(data);

  Map<String, dynamic> toJson() => _$DataGedungToJson(this);
}
