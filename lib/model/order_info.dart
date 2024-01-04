// To parse this JSON data, do
//
//     final orderInfo = orderInfoFromJson(jsonString);

import 'dart:convert';

OrderInfo orderInfoFromJson(String str) => OrderInfo.fromJson(json.decode(str));

String orderInfoToJson(OrderInfo data) => json.encode(data.toJson());

class OrderInfo {
  List<OrderHistory> orderHistory;
  String responseCode;
  String result;
  String responseMsg;

  OrderInfo({
    required this.orderHistory,
    required this.responseCode,
    required this.result,
    required this.responseMsg,
  });

  factory OrderInfo.fromJson(Map<String, dynamic> json) => OrderInfo(
        orderHistory: List<OrderHistory>.from(
            json["OrderHistory"].map((x) => OrderHistory.fromJson(x))),
        responseCode: json["ResponseCode"],
        result: json["Result"],
        responseMsg: json["ResponseMsg"],
      );

  Map<String, dynamic> toJson() => {
        "OrderHistory": List<dynamic>.from(orderHistory.map((x) => x.toJson())),
        "ResponseCode": responseCode,
        "Result": result,
        "ResponseMsg": responseMsg,
      };
}

class OrderHistory {
  String id;
  String customerName;
  String customerMobile;
  String customerAddress;
  String status;
  String flowId;
  String orderType;
  DateTime date;
  String total;

  OrderHistory({
    required this.id,
    required this.customerName,
    required this.customerMobile,
    required this.customerAddress,
    required this.status,
    required this.flowId,
    required this.orderType,
    required this.date,
    required this.total,
  });

  factory OrderHistory.fromJson(Map<String, dynamic> json) => OrderHistory(
        id: json["id"],
        customerName: json["customer_name"],
        customerMobile: json["customer_mobile"],
        customerAddress: json["customer_address"],
        status: json["status"],
        flowId: json["flow_id"],
        orderType: json["Order_Type"],
        date: DateTime.parse(json["date"]),
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "customer_name": customerName,
        "customer_mobile": customerMobile,
        "customer_address": customerAddress,
        "status": status,
        "flow_id": flowId,
        "Order_Type": orderType,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "total": total,
      };
}
