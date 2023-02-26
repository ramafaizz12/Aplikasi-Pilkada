import 'package:json_annotation/json_annotation.dart';
part 'dataaksesoris.g.dart';

@JsonSerializable()
class Dataaksesoris {
  String? nama;
  String? alamat;
  String? keterangan;
  

  Dataaksesoris({this.nama, this.alamat, this.keterangan});

  factory Dataaksesoris.fromJson(Map<String, dynamic> data) =>
      _$DataaksesorisFromJson(data);

  Map<String, dynamic> toJson() => _$DataaksesorisToJson(this);
}
