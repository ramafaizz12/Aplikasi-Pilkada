import 'package:json_annotation/json_annotation.dart';
part 'Provinsi.g.dart';

@JsonSerializable()
class DataProvinsi {
  int? id;
  String? name;

  DataProvinsi({this.id, this.name});

  factory DataProvinsi.fromJson(Map<String, dynamic> data) =>
      _$DataProvinsiFromJson(data);

  Map<String, dynamic> toJson() => _$DataProvinsiToJson(this);
}
