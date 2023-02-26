import 'package:json_annotation/json_annotation.dart';
part 'dashboard.g.dart';

@JsonSerializable()
class Datadashboard {
  int? dpt;
  int? tps;
  int? relawan;
  int? gruprelawan;
  int? kordinator;
  int? saksi;
  int? calek;

  Datadashboard(
      {this.dpt,
      this.tps,
      this.saksi,
      this.relawan,
      this.gruprelawan,
      this.kordinator,
      this.calek});

  factory Datadashboard.fromJson(Map<String, dynamic> data) =>
      _$DatadashboardFromJson(data);

  Map<String, dynamic> toJson() => _$DatadashboardToJson(this);
}
