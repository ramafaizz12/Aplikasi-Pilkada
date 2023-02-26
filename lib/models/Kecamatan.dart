import 'package:json_annotation/json_annotation.dart';
part 'Kecamatan.g.dart';

@JsonSerializable()
class DataKecamatan {
  int? id;
  String? name;

  DataKecamatan({this.id, this.name});

  factory DataKecamatan.fromJson(Map<String, dynamic> data) =>
      _$DataKecamatanFromJson(data);

  Map<String, dynamic> toJson() => _$DataKecamatanToJson(this);
}
