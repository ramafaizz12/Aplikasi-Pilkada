import 'package:json_annotation/json_annotation.dart';
part 'Desa.g.dart';

@JsonSerializable()
class DataDesa {
  int? id;
  String? name;

  DataDesa({this.id, this.name});

  factory DataDesa.fromJson(Map<String, dynamic> data) =>
      _$DataDesaFromJson(data);

  Map<String, dynamic> toJson() => _$DataDesaToJson(this);
}
