// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Datadashboard _$DatadashboardFromJson(Map<String, dynamic> json) =>
    Datadashboard(
      dpt: json['dpt'] as int?,
      tps: json['tps'] as int?,
      saksi: json['saksi'] as int?,
      relawan: json['relawan'] as int?,
      gruprelawan: json['gruprelawan'] as int?,
      kordinator: json['kordinator'] as int?,
      calek: json['calek'] as int?,
    );

Map<String, dynamic> _$DatadashboardToJson(Datadashboard instance) =>
    <String, dynamic>{
      'dpt': instance.dpt,
      'tps': instance.tps,
      'relawan': instance.relawan,
      'gruprelawan': instance.gruprelawan,
      'kordinator': instance.kordinator,
      'saksi': instance.saksi,
      'calek': instance.calek,
    };
