// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datagedung.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataGedung _$DataGedungFromJson(Map<String, dynamic> json) => DataGedung(
      id: json['id'] as int?,
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] as String?,
      nama_gedung: json['nama_gedung'] as String?,
      type_gedung: json['type_gedung'] as String?,
    );

Map<String, dynamic> _$DataGedungToJson(DataGedung instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type_gedung': instance.type_gedung,
      'nama_gedung': instance.nama_gedung,
      'updated_at': instance.updated_at,
      'created_at': instance.created_at,
    };
