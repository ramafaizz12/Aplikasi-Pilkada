import 'package:json_annotation/json_annotation.dart';
part 'datakandidat.g.dart';

@JsonSerializable()
class DataKandidat {
  String? no_kandidat;
  String? nama_kandidat;
  String? nama_wakil;
  String? visi_misi;
  String? program;
  String? foto;

  DataKandidat(
      {this.no_kandidat,
      this.nama_kandidat,
      this.nama_wakil,
      this.visi_misi,
      this.program,
      this.foto});

  factory DataKandidat.fromJson(Map<String, dynamic> data) =>
      _$DataKandidatFromJson(data);

  Map<String, dynamic> toJson() => _$DataKandidatToJson(this);
}
