import 'package:json_annotation/json_annotation.dart';
part 'Kabupaten.g.dart';

@JsonSerializable()
class DataKabupaten {
  int? id;
  String? name;

  DataKabupaten({this.id, this.name});

  factory DataKabupaten.fromJson(Map<String, dynamic> data) =>
      _$DataKabupatenFromJson(data);

  Map<String, dynamic> toJson() => _$DataKabupatenToJson(this);
}
