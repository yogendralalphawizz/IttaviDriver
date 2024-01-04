// To parse this JSON data, do
//
//     final dashboardInfo = dashboardInfoFromJson(jsonString);

import 'dart:convert';

DashboardInfo dashboardInfoFromJson(String str) =>
    DashboardInfo.fromJson(json.decode(str));

String dashboardInfoToJson(DashboardInfo data) => json.encode(data.toJson());

class DashboardInfo {
  DashboardInfo({
    required this.responseCode,
    required this.result,
    required this.responseMsg,
    required this.reportData,
    required this.withdrawLimit,
  });

  String responseCode;
  String result;
  String responseMsg;
  List<ReportDatum> reportData;
  String withdrawLimit;

  factory DashboardInfo.fromJson(Map<String, dynamic> json) => DashboardInfo(
        responseCode: json["ResponseCode"],
        result: json["Result"],
        responseMsg: json["ResponseMsg"],
        reportData: List<ReportDatum>.from(
            json["report_data"].map((x) => ReportDatum.fromJson(x))),
        withdrawLimit: json["withdraw_limit"],
      );

  Map<String, dynamic> toJson() => {
        "ResponseCode": responseCode,
        "Result": result,
        "ResponseMsg": responseMsg,
        "report_data": List<dynamic>.from(reportData.map((x) => x.toJson())),
        "withdraw_limit": withdrawLimit,
      };
}

class ReportDatum {
  ReportDatum({
    required this.title,
    required this.reportData,
    required this.url,
  });

  String title;
  int reportData;
  String url;

  factory ReportDatum.fromJson(Map<String, dynamic> json) => ReportDatum(
        title: json["title"],
        reportData: json["report_data"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "report_data": reportData,
        "url": url,
      };
}
