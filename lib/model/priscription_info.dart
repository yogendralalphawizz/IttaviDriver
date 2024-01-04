// To parse this JSON data, do
//
//     final priscriptionInfo = priscriptionInfoFromJson(jsonString);

import 'dart:convert';

PriscriptionInfo priscriptionInfoFromJson(String str) =>
    PriscriptionInfo.fromJson(json.decode(str));

String priscriptionInfoToJson(PriscriptionInfo data) =>
    json.encode(data.toJson());

class PriscriptionInfo {
  List<OrderHistory> pOrderHistory;
  String responseCode;
  String result;
  String responseMsg;

  PriscriptionInfo({
    required this.pOrderHistory,
    required this.responseCode,
    required this.result,
    required this.responseMsg,
  });

  factory PriscriptionInfo.fromJson(Map<String, dynamic> json) =>
      PriscriptionInfo(
        pOrderHistory: List<OrderHistory>.from(
            json["OrderHistory"].map((x) => OrderHistory.fromJson(x))),
        responseCode: json["ResponseCode"],
        result: json["Result"],
        responseMsg: json["ResponseMsg"],
      );

  Map<String, dynamic> toJson() => {
        "OrderHistory":
            List<dynamic>.from(pOrderHistory.map((x) => x.toJson())),
        "ResponseCode": responseCode,
        "Result": result,
        "ResponseMsg": responseMsg,
      };
}

class OrderHistory {
  String id;
  int totalProduct;
  String customerName;
  String customerMobile;
  String customerAddress;
  String status;
  String flowId;
  DateTime date;
  String total;

  OrderHistory({
    required this.id,
    required this.totalProduct,
    required this.customerName,
    required this.customerMobile,
    required this.customerAddress,
    required this.status,
    required this.flowId,
    required this.date,
    required this.total,
  });

  factory OrderHistory.fromJson(Map<String, dynamic> json) => OrderHistory(
        id: json["id"],
        totalProduct: json["total_product"],
        customerName: json["customer_name"],
        customerMobile: json["customer_mobile"],
        customerAddress: json["customer_address"],
        status: json["status"],
        flowId: json["flow_id"],
        date: DateTime.parse(json["date"]),
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "total_product": totalProduct,
        "customer_name": customerName,
        "customer_mobile": customerMobile,
        "customer_address": customerAddress,
        "status": status,
        "flow_id": flowId,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "total": total,
      };
}
