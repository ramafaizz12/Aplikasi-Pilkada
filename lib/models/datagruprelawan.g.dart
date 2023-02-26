// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datagruprelawan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataGruprelawan _$DataGruprelawanFromJson(Map<String, dynamic> json) =>
    DataGruprelawan(
      id: json['id'] as int?,
      nama_grup: json['nama_grup'] as String?,
      alamat_posko: json['alamat_posko'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$DataGruprelawanToJson(DataGruprelawan instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama_grup': instance.nama_grup,
      'alamat_posko': instance.alamat_posko,
      'email': instance.email,
    };
