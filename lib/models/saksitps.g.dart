// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saksitps.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataSaksi _$DataSaksiFromJson(Map<String, dynamic> json) => DataSaksi(
      nama_saksi: json['nama_saksi'] as String?,
      nik: json['nik'] as String?,
      alamat: json['alamat'] as String?,
      no_hp: json['no_hp'] as String?,
      foto: json['foto'] as String?,
      saksi: json['saksi'] as String?,
      Province_id: json['Province_id'] as String?,
      regency_id: json['regency_id'] as String?,
      district_id: json['district_id'] as String?,
    )
      ..tps_id = json['tps_id'] as String?
      ..email = json['email'] as String?
      ..role = json['role'] as String?;

Map<String, dynamic> _$DataSaksiToJson(DataSaksi instance) => <String, dynamic>{
      'nama_saksi': instance.nama_saksi,
      'nik': instance.nik,
      'alamat': instance.alamat,
      'tps_id': instance.tps_id,
      'email': instance.email,
      'role': instance.role,
      'no_hp': instance.no_hp,
      'foto': instance.foto,
      'saksi': instance.saksi,
      'Province_id': instance.Province_id,
      'regency_id': instance.regency_id,
      'district_id': instance.district_id,
    };
