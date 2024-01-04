// To parse this JSON data, do
//
//     final orderInformetionInfo = orderInformetionInfoFromJson(jsonString);

import 'dart:convert';

OrderInformetionInfo orderInformetionInfoFromJson(String str) =>
    OrderInformetionInfo.fromJson(json.decode(str));

String orderInformetionInfoToJson(OrderInformetionInfo data) =>
    json.encode(data.toJson());

class OrderInformetionInfo {
  String responseCode;
  String result;
  String responseMsg;
  Orderdata orderdata;

  OrderInformetionInfo({
    required this.responseCode,
    required this.result,
    required this.responseMsg,
    required this.orderdata,
  });

  factory OrderInformetionInfo.fromJson(Map<String, dynamic> json) =>
      OrderInformetionInfo(
        responseCode: json["ResponseCode"],
        result: json["Result"],
        responseMsg: json["ResponseMsg"],
        orderdata: Orderdata.fromJson(json["orderdata"]),
      );

  Map<String, dynamic> toJson() => {
        "ResponseCode": responseCode,
        "Result": result,
        "ResponseMsg": responseMsg,
        "orderdata": orderdata.toJson(),
      };
}

class Orderdata {
  String riderTitle;
  String riderImage;
  String riderMobile;
  String orderId;
  DateTime orderDate;
  String pMethodName;
  String customerAddress;
  String customerName;
  String orderType;
  String wallAmt;
  String customerMobile;
  String storeCharge;
  String deliveryCharge;
  String deliveryTimeslot;
  String couponAmount;
  String orderTotal;
  String orderSubTotal;
  String flowId;
  String orderTransactionId;
  String additionalNote;
  String orderStatus;
  List<OrderProduct> orderProducts;

  Orderdata({
    required this.riderTitle,
    required this.riderImage,
    required this.riderMobile,
    required this.orderId,
    required this.orderDate,
    required this.pMethodName,
    required this.customerAddress,
    required this.customerName,
    required this.orderType,
    required this.wallAmt,
    required this.customerMobile,
    required this.storeCharge,
    required this.deliveryCharge,
    required this.deliveryTimeslot,
    required this.couponAmount,
    required this.orderTotal,
    required this.orderSubTotal,
    required this.flowId,
    required this.orderTransactionId,
    required this.additionalNote,
    required this.orderStatus,
    required this.orderProducts,
  });

  factory Orderdata.fromJson(Map<String, dynamic> json) => Orderdata(
        riderTitle: json["rider_title"],
        riderImage: json["rider_image"],
        riderMobile: json["rider_mobile"],
        orderId: json["order_id"].toString(),
        orderDate: DateTime.parse(json["order_date"]),
        pMethodName: json["p_method_name"],
        customerAddress: json["customer_address"],
        customerName: json["customer_name"],
        orderType: json["Order_Type"],
        wallAmt: json["wall_amt"].toString(),
        customerMobile: json["customer_mobile"].toString(),
        storeCharge: json["store_charge"].toString(),
        deliveryCharge: json["Delivery_charge"].toString(),
        deliveryTimeslot: json["Delivery_Timeslot"],
        couponAmount: json["Coupon_Amount"].toString(),
        orderTotal: json["Order_Total"].toString(),
        orderSubTotal: json["Order_SubTotal"].toString(),
        flowId: json["flow_id"].toString(),
        orderTransactionId: json["Order_Transaction_id"],
        additionalNote: json["Additional_Note"],
        orderStatus: json["Order_Status"],
        orderProducts: List<OrderProduct>.from(
            json["order_products"].map((x) => OrderProduct.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "rider_title": riderTitle,
        "rider_image": riderImage,
        "rider_mobile": riderMobile,
        "order_id": orderId,
        "order_date":
            "${orderDate.year.toString().padLeft(4, '0')}-${orderDate.month.toString().padLeft(2, '0')}-${orderDate.day.toString().padLeft(2, '0')}",
        "p_method_name": pMethodName,
        "customer_address": customerAddress,
        "customer_name": customerName,
        "Order_Type": orderType,
        "wall_amt": wallAmt,
        "customer_mobile": customerMobile,
        "store_charge": storeCharge,
        "Delivery_charge": deliveryCharge,
        "Delivery_Timeslot": deliveryTimeslot,
        "Coupon_Amount": couponAmount,
        "Order_Total": orderTotal,
        "Order_SubTotal": orderSubTotal,
        "flow_id": flowId,
        "Order_Transaction_id": orderTransactionId,
        "Additional_Note": additionalNote,
        "Order_Status": orderStatus,
        "order_products":
            List<dynamic>.from(orderProducts.map((x) => x.toJson())),
      };
}

class OrderProduct {
  String productQuantity;
  String productName;
  String productDiscount;
  String productImage;
  String productPrice;
  String productType;

  OrderProduct({
    required this.productQuantity,
    required this.productName,
    required this.productDiscount,
    required this.productImage,
    required this.productPrice,
    required this.productType,
  });

  factory OrderProduct.fromJson(Map<String, dynamic> json) => OrderProduct(
        productQuantity: json["Product_quantity"].toString(),
        productName: json["Product_name"],
        productDiscount: json["Product_discount"].toString(),
        productImage: json["Product_image"],
        productPrice: json["Product_price"].toString(),
        productType: json["Product_type"],
      );

  Map<String, dynamic> toJson() => {
        "Product_quantity": productQuantity,
        "Product_name": productName,
        "Product_discount": productDiscount,
        "Product_image": productImage,
        "Product_price": productPrice,
        "Product_type": productType,
      };
}
