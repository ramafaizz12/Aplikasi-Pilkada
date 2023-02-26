// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datakandidat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataKandidat _$DataKandidatFromJson(Map<String, dynamic> json) => DataKandidat(
      no_kandidat: json['no_kandidat'] as String?,
      nama_kandidat: json['nama_kandidat'] as String?,
      nama_wakil: json['nama_wakil'] as String?,
      visi_misi: json['visi_misi'] as String?,
      program: json['program'] as String?,
      foto: json['foto'] as String?,
    );

Map<String, dynamic> _$DataKandidatToJson(DataKandidat instance) =>
    <String, dynamic>{
      'no_kandidat': instance.no_kandidat,
      'nama_kandidat': instance.nama_kandidat,
      'nama_wakil': instance.nama_wakil,
      'visi_misi': instance.visi_misi,
      'program': instance.program,
      'foto': instance.foto,
    };
