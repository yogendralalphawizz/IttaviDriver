// To parse this JSON data, do
//
//     final preDetailsInfo = preDetailsInfoFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

PreDetailsInfo preDetailsInfoFromJson(String str) =>
    PreDetailsInfo.fromJson(json.decode(str));

String preDetailsInfoToJson(PreDetailsInfo data) => json.encode(data.toJson());

class PreDetailsInfo {
  String responseCode;
  String result;
  String responseMsg;
  OrderProductList orderProductList;

  PreDetailsInfo({
    required this.responseCode,
    required this.result,
    required this.responseMsg,
    required this.orderProductList,
  });

  factory PreDetailsInfo.fromJson(Map<String, dynamic> json) => PreDetailsInfo(
        responseCode: json["ResponseCode"],
        result: json["Result"],
        responseMsg: json["ResponseMsg"],
        orderProductList: OrderProductList.fromJson(json["OrderProductList"]),
      );

  Map<String, dynamic> toJson() => {
        "ResponseCode": responseCode,
        "Result": result,
        "ResponseMsg": responseMsg,
        "OrderProductList": orderProductList.toJson(),
      };
}

class OrderProductList {
  String orderId;
  String pMethodName;
  String customerAddress;
  String customerName;
  String customerMobile;
  String deliveryCharge;
  String couponAmount;
  String walletAmount;
  String flowId;
  String storeCharge;
  String orderTotal;
  String orderSubTotal;
  String orderTransactionId;
  String additionalNote;
  String orderStatus;
  List<OrderProductDatum> orderProductData;

  OrderProductList({
    required this.orderId,
    required this.pMethodName,
    required this.customerAddress,
    required this.customerName,
    required this.customerMobile,
    required this.deliveryCharge,
    required this.couponAmount,
    required this.walletAmount,
    required this.flowId,
    required this.storeCharge,
    required this.orderTotal,
    required this.orderSubTotal,
    required this.orderTransactionId,
    required this.additionalNote,
    required this.orderStatus,
    required this.orderProductData,
  });

  factory OrderProductList.fromJson(Map<String, dynamic> json) =>
      OrderProductList(
        orderId: json["order_id"],
        pMethodName: json["p_method_name"],
        customerAddress: json["customer_address"],
        customerName: json["customer_name"],
        customerMobile: json["customer_mobile"],
        deliveryCharge: json["Delivery_charge"],
        couponAmount: json["Coupon_Amount"],
        walletAmount: json["Wallet_Amount"],
        flowId: json["flow_id"],
        storeCharge: json["store_charge"],
        orderTotal: json["Order_Total"],
        orderSubTotal: json["Order_SubTotal"],
        orderTransactionId: json["Order_Transaction_id"],
        additionalNote: json["Additional_Note"],
        orderStatus: json["Order_Status"],
        orderProductData: List<OrderProductDatum>.from(
            json["Order_Product_Data"]
                .map((x) => OrderProductDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "p_method_name": pMethodName,
        "customer_address": customerAddress,
        "customer_name": customerName,
        "customer_mobile": customerMobile,
        "Delivery_charge": deliveryCharge,
        "Coupon_Amount": couponAmount,
        "Wallet_Amount": walletAmount,
        "flow_id": flowId,
        "store_charge": storeCharge,
        "Order_Total": orderTotal,
        "Order_SubTotal": orderSubTotal,
        "Order_Transaction_id": orderTransactionId,
        "Additional_Note": additionalNote,
        "Order_Status": orderStatus,
        "Order_Product_Data":
            List<dynamic>.from(orderProductData.map((x) => x.toJson())),
      };
}

class OrderProductDatum {
  String productId;
  String productName;
  String productQuantity;
  String productDiscount;
  String productImage;
  String productPrice;
  String productVariation;
  String deliveryTimeslot;
  int productTotal;
  String totaldelivery;
  DateTime startdate;
  List<Totaldate> totaldates;

  OrderProductDatum({
    required this.productId,
    required this.productName,
    required this.productQuantity,
    required this.productDiscount,
    required this.productImage,
    required this.productPrice,
    required this.productVariation,
    required this.deliveryTimeslot,
    required this.productTotal,
    required this.totaldelivery,
    required this.startdate,
    required this.totaldates,
  });

  factory OrderProductDatum.fromJson(Map<String, dynamic> json) =>
      OrderProductDatum(
        productId: json["Product_id"],
        productName: json["Product_name"],
        productQuantity: json["Product_quantity"],
        productDiscount: json["Product_discount"],
        productImage: json["Product_image"],
        productPrice: json["Product_price"],
        productVariation: json["Product_variation"],
        deliveryTimeslot: json["Delivery_Timeslot"],
        productTotal: json["Product_total"],
        totaldelivery: json["totaldelivery"],
        startdate: DateTime.parse(json["startdate"]),
        totaldates: List<Totaldate>.from(
            json["totaldates"].map((x) => Totaldate.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Product_id": productId,
        "Product_name": productName,
        "Product_quantity": productQuantity,
        "Product_discount": productDiscount,
        "Product_image": productImage,
        "Product_price": productPrice,
        "Product_variation": productVariation,
        "Delivery_Timeslot": deliveryTimeslot,
        "Product_total": productTotal,
        "totaldelivery": totaldelivery,
        "startdate":
            "${startdate.year.toString().padLeft(4, '0')}-${startdate.month.toString().padLeft(2, '0')}-${startdate.day.toString().padLeft(2, '0')}",
        "totaldates": List<dynamic>.from(totaldates.map((x) => x.toJson())),
      };
}

class Totaldate {
  DateTime date;
  bool isComplete;
  String formatDate;

  Totaldate({
    required this.date,
    required this.isComplete,
    required this.formatDate,
  });

  factory Totaldate.fromJson(Map<String, dynamic> json) => Totaldate(
        date: DateTime.parse(json["date"]),
        isComplete: json["is_complete"],
        formatDate: json["format_date"],
      );

  Map<String, dynamic> toJson() => {
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "is_complete": isComplete,
        "format_date": formatDate,
      };
}
