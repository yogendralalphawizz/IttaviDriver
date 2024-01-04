// ignore_for_file: prefer_const_constructors, sort_child_properties_last, sized_box_for_whitespace, prefer_typing_uninitialized_variables, prefer_interpolation_to_compose_strings, avoid_print, unused_local_variable, unnecessary_brace_in_string_interps, unnecessary_string_interpolations, non_constant_identifier_names, prefer_const_literals_to_create_immutables, unused_element, unused_field, prefer_final_fields

import 'dart:convert';
import 'package:deliveryboy/Api/Config.dart';
import 'package:deliveryboy/controller/priscription_controller.dart';
import 'package:deliveryboy/helpar/fontfamily_model.dart';
import 'package:deliveryboy/screen/dashboard_screen.dart';
import 'package:deliveryboy/utils/Colors.dart';
import 'package:deliveryboy/utils/Custom_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import 'dart:ui' as ui;

class MyPriscriptionInfo extends StatefulWidget {
  const MyPriscriptionInfo({super.key});

  @override
  State<MyPriscriptionInfo> createState() => _MyPriscriptionInfoState();
}

class _MyPriscriptionInfoState extends State<MyPriscriptionInfo> {
  String oID = Get.arguments["oID"];
  GlobalKey<SfSignaturePadState> _signaturePadKey = GlobalKey();
  PreScriptionControllre preScriptionControllre = Get.find();

  final note = TextEditingController();
  var selectedRadioTile;
  String? rejectmsg = '';

  String imageEncoded = "";

  @override
  void initState() {
    super.initState();
    setState(() {
      _signaturePadKey.currentState?.clear();
      imageEncoded = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(
        leading: BackButton(
          color: BlackColor,
        ),
        title: Text(
          "${"Order ID:".tr} #$oID",
          style: TextStyle(
              fontFamily: FontFamily.gilroyBold,
              color: BlackColor,
              fontSize: 17),
        ),
        elevation: 0,
        backgroundColor: WhiteColor,
      ),
      bottomNavigationBar:
      GetBuilder<PreScriptionControllre>(builder: (context) {
        return preScriptionControllre.preDetailsInfo?.orderProductList.flowId ==
            "3"
            ? Container(
          color: WhiteColor,
          height: Get.height * 0.09,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "$currency${preScriptionControllre.preDetailsInfo?.orderProductList.orderTotal}",
                          style: TextStyle(
                            fontFamily: FontFamily.gilroyBold,
                            color: BlackColor,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          width: Get.width * 0.02,
                        ),
                        Image.asset(
                          "assets/downarrow.png",
                          height: 14,
                          width: 14,
                        )
                      ],
                    ),
                    SizedBox(height: Get.height * 0.005),
                    Text(
                      "Total",
                      style: TextStyle(
                        fontFamily: FontFamily.gilroyMedium,
                        color: greyColor,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                InkWell(
                  child: InkWell(
                    onTap: () {
                      preScriptionControllre.mackDecisionApi(
                          orderID: oID, status: "1", reson: "n/a");
                    },
                    child: Container(
                      height: 50,
                      width: Get.width * 0.45,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: gradient.btnGradient,
                      ),
                      child: Text(
                        "Accept",
                        style: TextStyle(
                          fontFamily: FontFamily.gilroyBold,
                          color: WhiteColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
            : preScriptionControllre.preDetailsInfo?.orderProductList.flowId ==
            "4"
            ? Container(
          color: WhiteColor,
          height: Get.height * 0.09,
          child: Padding(
            padding:
            EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "$currency${preScriptionControllre.preDetailsInfo?.orderProductList.orderTotal}",
                          style: TextStyle(
                            fontFamily: FontFamily.gilroyBold,
                            color: BlackColor,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          width: Get.width * 0.02,
                        ),
                        Image.asset(
                          "assets/downarrow.png",
                          height: 14,
                          width: 14,
                        )
                      ],
                    ),
                    SizedBox(height: Get.height * 0.005),
                    Text(
                      "Total",
                      style: TextStyle(
                        fontFamily: FontFamily.gilroyMedium,
                        color: greyColor,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                InkWell(
                  child: InkWell(
                    onTap: () {
                      if (preScriptionControllre.isComplite == "0") {
                        if (imageEncoded != "") {
                          preScriptionControllre.completeOrderApi(
                              orderID: oID, image: imageEncoded);
                          imageEncoded = "";
                        } else {
                          showToastMessage("Please Signature");
                        }
                      } else {
                        showToastMessage(
                            "Kindly ensure that all delivery dates are marked as completed before proceeding.");
                      }
                    },
                    child: Container(
                      height: 50,
                      width: Get.width * 0.45,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: gradient.btnGradient,
                      ),
                      child: Text(
                        "Delivered",
                        style: TextStyle(
                          fontFamily: FontFamily.gilroyBold,
                          color: WhiteColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
            : SizedBox();
      }),
      body: GetBuilder<PreScriptionControllre>(builder: (context) {
        return SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: preScriptionControllre.isLoading
                ? Column(
              children: [
                SizedBox(height: Get.height * 0.02),
                Container(
                  padding:
                  EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: WhiteColor),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Product Info".tr,
                        style: TextStyle(
                          fontFamily: FontFamily.gilroyBold,
                          fontSize: 14,
                          color: gradient.defoultColor,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: 120,
                        width: double.infinity,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: preScriptionControllre.preDetailsInfo
                              ?.orderProductList.orderProductData.length,
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                preScriptionControllre
                                    .changeIndexProductWise(index: index);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.all(5),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 80,
                                      width: 100,
                                      padding: EdgeInsets.all(5),
                                      alignment: Alignment.center,
                                      child: ClipRRect(
                                        borderRadius:
                                        BorderRadius.circular(5),
                                        child: FadeInImage.assetNetwork(
                                          placeholder:
                                          "assets/ezgif.com-crop.gif",
                                          placeholderCacheHeight: 80,
                                          placeholderCacheWidth: 100,
                                          placeholderFit: BoxFit.cover,
                                          image:
                                          "${Config.imageurl}${preScriptionControllre.preDetailsInfo?.orderProductList.orderProductData[index].productImage}",
                                          height: 80,
                                          width: 100,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 100,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 2),
                                        child: Text(
                                          "${preScriptionControllre.preDetailsInfo?.orderProductList.orderProductData[index].productName}",
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily:
                                            FontFamily.gilroyBold,
                                            color: greytext,
                                            overflow:
                                            TextOverflow.ellipsis,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                  border: preScriptionControllre
                                      .currentIndex ==
                                      index
                                      ? Border.all(
                                      color: gradient.defoultColor)
                                      : Border.all(
                                      color: Colors.grey.shade300),
                                  // color: preScriptionControllre
                                  //             .currentIndex ==
                                  //         index
                                  //     ? Color(0xffdaedfd)
                                  //     : WhiteColor,
                                  color: WhiteColor,
                                  borderRadius: BorderRadius.circular(7),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: Get.size.height * 0.02),
                Container(
                  padding:
                  EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Delivery Date".tr,
                        style: TextStyle(
                          fontFamily: FontFamily.gilroyBold,
                          fontSize: 14,
                          color: gradient.defoultColor,
                        ),
                      ),
                      SizedBox(
                        height: 60,
                        child: ListView.builder(
                          itemCount: preScriptionControllre
                              .preDetailsInfo
                              ?.orderProductList
                              .orderProductData[
                          preScriptionControllre.currentIndex]
                              .totaldates
                              .length,
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            return Stack(
                              children: [
                                InkWell(
                                  onTap: () {
                                    if (preScriptionControllre
                                        .preDetailsInfo
                                        ?.orderProductList
                                        .flowId !=
                                        "3") {
                                      if (preScriptionControllre
                                          .preDetailsInfo
                                          ?.orderProductList
                                          .orderProductData[
                                      preScriptionControllre
                                          .currentIndex]
                                          .totaldates[index]
                                          .isComplete ==
                                          false) {
                                        deliveryCompliteSheet(
                                          id: oID,
                                          selectDate: preScriptionControllre
                                              .preDetailsInfo
                                              ?.orderProductList
                                              .orderProductData[
                                          preScriptionControllre
                                              .currentIndex]
                                              .totaldates[index]
                                              .date
                                              .toString(),
                                          productId: preScriptionControllre
                                              .preDetailsInfo
                                              ?.orderProductList
                                              .orderProductData[
                                          preScriptionControllre
                                              .currentIndex]
                                              .productId,
                                        );
                                      }
                                    } else {
                                      showToastMessage(
                                          "Please accept order!");
                                    }
                                  },
                                  child: Container(
                                    height: 60,
                                    width: 50,
                                    margin: EdgeInsets.all(5),
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Text(
                                      preScriptionControllre
                                          .preDetailsInfo
                                          ?.orderProductList
                                          .orderProductData[
                                      preScriptionControllre
                                          .currentIndex]
                                          .totaldates[index]
                                          .formatDate ??
                                          "",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily:
                                        FontFamily.gilroyMedium,
                                        fontSize: 12,
                                        color: Colors.grey,
                                        height: 1.2,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(7),
                                      border: preScriptionControllre
                                          .preDetailsInfo
                                          ?.orderProductList
                                          .orderProductData[
                                      preScriptionControllre
                                          .currentIndex]
                                          .totaldates[index]
                                          .isComplete ==
                                          false
                                          ? Border.all(
                                          color: Colors.grey.shade300)
                                          : Border.all(
                                          color:
                                          gradient.defoultColor),
                                    ),
                                  ),
                                ),
                                preScriptionControllre
                                    .preDetailsInfo
                                    ?.orderProductList
                                    .orderProductData[
                                preScriptionControllre
                                    .currentIndex]
                                    .totaldates[index]
                                    .isComplete ==
                                    true
                                    ? Positioned(
                                  right: 0,
                                  child: Container(
                                    height: 20,
                                    width: 20,
                                    padding: EdgeInsets.all(1),
                                    alignment: Alignment.center,
                                    child: Image.asset(
                                      "assets/double-check.png",
                                      color: WhiteColor,
                                      height: 15,
                                      width: 15,
                                    ),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: gradient.defoultColor,
                                    ),
                                  ),
                                )
                                    : SizedBox(),
                              ],
                            );
                          },
                        ),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: WhiteColor,
                  ),
                ),
                SizedBox(height: Get.size.height * 0.02),
                Container(
                  padding:
                  EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Item Info".tr,
                        style: TextStyle(
                          fontFamily: FontFamily.gilroyBold,
                          fontSize: 14,
                          color: gradient.defoultColor,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Price".tr,
                                  style: TextStyle(
                                    fontFamily: FontFamily.gilroyBold,
                                    fontSize: 13,
                                    color: greytext,
                                  ),
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  ":",
                                  style: TextStyle(
                                    fontFamily: FontFamily.gilroyBold,
                                    fontSize: 13,
                                    color: greytext,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "${currency}${preScriptionControllre.preDetailsInfo?.orderProductList.orderProductData[preScriptionControllre.currentIndex].productPrice}",
                                  style: TextStyle(
                                    fontFamily: FontFamily.gilroyBold,
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "Total".tr,
                                  style: TextStyle(
                                    fontFamily: FontFamily.gilroyBold,
                                    fontSize: 13,
                                    color: greytext,
                                  ),
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  ":",
                                  style: TextStyle(
                                    fontFamily: FontFamily.gilroyBold,
                                    fontSize: 13,
                                    color: greytext,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "${currency}${preScriptionControllre.preDetailsInfo?.orderProductList.orderProductData[preScriptionControllre.currentIndex].productTotal}",
                                  style: TextStyle(
                                    fontFamily: FontFamily.gilroyBold,
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Variation".tr,
                                  style: TextStyle(
                                    fontFamily: FontFamily.gilroyBold,
                                    fontSize: 13,
                                    color: greytext,
                                  ),
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  ":",
                                  style: TextStyle(
                                    fontFamily: FontFamily.gilroyBold,
                                    fontSize: 13,
                                    color: greytext,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "${preScriptionControllre.preDetailsInfo?.orderProductList.orderProductData[preScriptionControllre.currentIndex].productVariation}",
                                  style: TextStyle(
                                    fontFamily: FontFamily.gilroyBold,
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "Qty".tr,
                                  style: TextStyle(
                                    fontFamily: FontFamily.gilroyBold,
                                    fontSize: 13,
                                    color: greytext,
                                  ),
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  ":",
                                  style: TextStyle(
                                    fontFamily: FontFamily.gilroyBold,
                                    fontSize: 13,
                                    color: greytext,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "${preScriptionControllre.preDetailsInfo?.orderProductList.orderProductData[preScriptionControllre.currentIndex].productQuantity}",
                                  style: TextStyle(
                                    fontFamily: FontFamily.gilroyBold,
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Start Date".tr,
                                  style: TextStyle(
                                    fontFamily: FontFamily.gilroyBold,
                                    fontSize: 13,
                                    color: greytext,
                                  ),
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  ":",
                                  style: TextStyle(
                                    fontFamily: FontFamily.gilroyBold,
                                    fontSize: 13,
                                    color: greytext,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "${preScriptionControllre.preDetailsInfo?.orderProductList.orderProductData[preScriptionControllre.currentIndex].startdate.toString().split(" ").first}",
                                  style: TextStyle(
                                    fontFamily: FontFamily.gilroyBold,
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "Total Delivery".tr,
                                  style: TextStyle(
                                    fontFamily: FontFamily.gilroyBold,
                                    fontSize: 13,
                                    color: greytext,
                                  ),
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  ":",
                                  style: TextStyle(
                                    fontFamily: FontFamily.gilroyBold,
                                    fontSize: 13,
                                    color: greytext,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "${preScriptionControllre.preDetailsInfo?.orderProductList.orderProductData[preScriptionControllre.currentIndex].totaldelivery}",
                                  style: TextStyle(
                                    fontFamily: FontFamily.gilroyBold,
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      OrderInfo(
                        title: "Delivery time".tr,
                        subtitle:
                        "${preScriptionControllre.preDetailsInfo?.orderProductList.orderProductData[preScriptionControllre.currentIndex].deliveryTimeslot}",
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: WhiteColor,
                  ),
                ),
                SizedBox(height: Get.height * 0.02),
                Container(
                  padding:
                  EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  width: Get.size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Order Info".tr,
                        style: TextStyle(
                          fontFamily: FontFamily.gilroyBold,
                          fontSize: 14,
                          color: gradient.defoultColor,
                        ),
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      OrderInfo(
                        title: "Subtotal".tr,
                        subtitle:
                        "${currency}${preScriptionControllre.preDetailsInfo?.orderProductList.orderSubTotal}",
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      OrderInfo(
                        title: "Delivery Charge".tr,
                        subtitle:
                        "${currency}${preScriptionControllre.preDetailsInfo?.orderProductList.deliveryCharge}",
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      OrderInfo(
                        title: "Store Charge".tr,
                        subtitle:
                        "${currency}${preScriptionControllre.preDetailsInfo?.orderProductList.storeCharge}",
                      ),
                      preScriptionControllre.preDetailsInfo
                          ?.orderProductList.couponAmount !=
                          "0"
                          ? SizedBox(
                        height: 13,
                      )
                          : SizedBox(),
                      preScriptionControllre.preDetailsInfo
                          ?.orderProductList.couponAmount !=
                          "0"
                          ? OrderInfo(
                        title: "Coupon Amount".tr,
                        subtitle:
                        "${currency}${preScriptionControllre.preDetailsInfo?.orderProductList.couponAmount}",
                      )
                          : SizedBox(),
                      SizedBox(
                        height: 13,
                      ),
                      OrderInfo(
                        title: "Total".tr,
                        subtitle:
                        "${currency}${preScriptionControllre.preDetailsInfo?.orderProductList.orderTotal}",
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Payment Method".tr,
                            style: TextStyle(
                              fontFamily: FontFamily.gilroyBold,
                              fontSize: 13,
                              color: greytext,
                            ),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            ":",
                            style: TextStyle(
                              fontFamily: FontFamily.gilroyBold,
                              fontSize: 13,
                              color: greytext,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          SizedBox(
                            width: Get.size.width * 0.45,
                            height: 35,
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  preScriptionControllre
                                      .preDetailsInfo
                                      ?.orderProductList
                                      .pMethodName ??
                                      "",
                                  style: TextStyle(
                                    fontFamily: FontFamily.gilroyBold,
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  "(${preScriptionControllre.preDetailsInfo?.orderProductList.orderTransactionId})",
                                  style: TextStyle(
                                    fontFamily: FontFamily.gilroyBold,
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // myOrderController.nDetailsInfo?.orderProductList
                      //             .deliveryTimeslot !=
                      //         "0"
                      //     ?
                      // : SizedBox(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Address".tr,
                            style: TextStyle(
                              fontFamily: FontFamily.gilroyBold,
                              fontSize: 13,
                              color: greytext,
                            ),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            ":",
                            style: TextStyle(
                              fontFamily: FontFamily.gilroyBold,
                              fontSize: 13,
                              color: greytext,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          SizedBox(
                            width: Get.size.width * 0.72,
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  preScriptionControllre
                                      .preDetailsInfo
                                      ?.orderProductList
                                      .customerAddress ??
                                      "",
                                  maxLines: 3,
                                  style: TextStyle(
                                    fontFamily: FontFamily.gilroyBold,
                                    fontSize: 14,
                                    color: Colors.grey,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: WhiteColor,
                  ),
                ),
                SizedBox(height: Get.height * 0.02),
                preScriptionControllre.preDetailsInfo?.orderProductList
                    .additionalNote !=
                    ""
                    ? Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 12, vertical: 12),
                  width: Get.size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Addition Note".tr,
                        style: TextStyle(
                          fontFamily: FontFamily.gilroyBold,
                          color: gradient.defoultColor,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        preScriptionControllre.preDetailsInfo
                            ?.orderProductList.additionalNote ??
                            "",
                        style: TextStyle(
                          fontFamily: FontFamily.gilroyBold,
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: WhiteColor,
                  ),
                )
                    : SizedBox(),
                preScriptionControllre.preDetailsInfo?.orderProductList
                    .flowId ==
                    "4" &&
                    preScriptionControllre.isComplite == "0"
                    ? Stack(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: SfSignaturePad(
                          key: _signaturePadKey,
                          minimumStrokeWidth: 1,
                          maximumStrokeWidth: 3,
                          strokeColor: Colors.blue,
                          backgroundColor: WhiteColor,
                          onDrawEnd: () async {
                            ui.Image signatureData =
                            await _signaturePadKey.currentState!
                                .toImage();
                            ByteData? byteData =
                            await signatureData.toByteData(
                                format: ui.ImageByteFormat.png);
                            imageEncoded = base64.encode(
                                byteData!.buffer.asUint8List());
                            setState(() {});
                          },
                        ),
                      ),
                      height: 200,
                      width: Get.size.width,
                      decoration: BoxDecoration(
                        color: WhiteColor,
                        border:
                        Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 10,
                      child: InkWell(
                        onTap: () {
                          imageEncoded = "";
                          _signaturePadKey.currentState?.clear();
                          setState(() {});
                        },
                        child: Container(
                          height: 40,
                          width: 100,
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/Thrash.png",
                                height: 20,
                                width: 20,
                                color: WhiteColor,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                "Clear",
                                style: TextStyle(
                                  fontFamily: FontFamily.gilroyBold,
                                  color: WhiteColor,
                                ),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            gradient: gradient.btnGradient,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
                    : SizedBox(),
              ],
            )
                : SizedBox(
              height: Get.height,
              width: Get.width,
              child: Center(
                child: CircularProgressIndicator(
                  color: gradient.defoultColor,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Future deliveryCompliteSheet({String? id, String? selectDate, productId}) {
    return Get.bottomSheet(
      Container(
        height: 220,
        width: Get.size.width,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "Deliveries".tr,
              style: TextStyle(
                fontSize: 20,
                fontFamily: FontFamily.gilroyBold,
                color: BlackColor,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Divider(
                color: greycolor,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Do you want to deliver the product today?".tr,
              style: TextStyle(
                fontFamily: FontFamily.gilroyMedium,
                fontSize: 16,
                color: BlackColor,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      height: 50,
                      margin: EdgeInsets.all(15),
                      alignment: Alignment.center,
                      child: Text(
                        "No".tr,
                        style: TextStyle(
                          color: gradient.defoultColor,
                          fontFamily: FontFamily.gilroyBold,
                          fontSize: 16,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: gradient.defoultColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(45),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      preScriptionControllre.compliteDeliveries(
                        orderId: id,
                        selectDate: selectDate,
                        productId: productId,
                      );
                    },
                    child: Container(
                      height: 50,
                      margin: EdgeInsets.all(15),
                      alignment: Alignment.center,
                      child: Text(
                        "Yes".tr,
                        style: TextStyle(
                          color: WhiteColor,
                          fontFamily: FontFamily.gilroyBold,
                          fontSize: 16,
                        ),
                      ),
                      decoration: BoxDecoration(
                        gradient: gradient.btnGradient,
                        borderRadius: BorderRadius.circular(45),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
        decoration: BoxDecoration(
          color: WhiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
      ),
    );
  }

  // Future<void> _showSimpleDialog(
  //     {String? id, String? selectDate, productId}) async {
  //   await showDialog<void>(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return SimpleDialog(
  //           children: <Widget>[
  //             SimpleDialogOption(
  //               onPressed: () {
  //                 Navigator.of(context).pop();
  //               },
  //               child: Row(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Text(
  //                     'Deliveries',
  //                     style: TextStyle(
  //                         fontFamily: FontFamily.gilroyBold,
  //                         color: BlackColor,
  //                         fontSize: 18),
  //                   )
  //                 ],
  //               ),
  //             ),
  //             SimpleDialogOption(
  //               onPressed: () {
  //                 Navigator.of(context).pop();
  //               },
  //               child: Text(
  //                 'Do you want to deliver the product today?',
  //                 style: TextStyle(
  //                     fontFamily: FontFamily.gilroyBold,
  //                     color: BlackColor,
  //                     fontSize: 16),
  //               ),
  //             ),
  //             SizedBox(height: Get.height * 0.02),
  //             SimpleDialogOption(
  //               onPressed: () {
  //                 Navigator.of(context).pop();
  //               },
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.end,
  //                 children: [
  //                   Text(
  //                     'No'.toUpperCase(),
  //                     style: TextStyle(
  //                         fontFamily: FontFamily.gilroyBold,
  //                         color: gradient.defoultColor,
  //                         fontSize: 14),
  //                   ),
  //                   SizedBox(width: Get.width * 0.04),
  //                   InkWell(
  //                     onTap: () {
  //                       preScriptionControllre.compliteDeliveries(
  //                         orderId: id,
  //                         selectDate: selectDate,
  //                         productId: productId,
  //                       );
  //                     },
  //                     child: Text(
  //                       'Yes'.toUpperCase(),
  //                       style: TextStyle(
  //                           fontFamily: FontFamily.gilroyBold,
  //                           color: gradient.defoultColor,
  //                           fontSize: 14),
  //                     ),
  //                   )
  //                 ],
  //               ),
  //             ),
  //           ],
  //         );
  //       });
  // }

  ticketCancell(orderId) {
    showModalBottomSheet(
        isDismissible: false,
        isScrollControlled: true,
        backgroundColor: WhiteColor,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: Get.height * 0.02),
                        Container(
                            height: 6,
                            width: 80,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(25))),
                        SizedBox(height: Get.height * 0.02),
                        Text(
                          "Select Reason".tr,
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Gilroy Bold',
                              color: BlackColor),
                        ),
                        SizedBox(height: Get.height * 0.02),
                        Text(
                          "Please select the reason for cancellation:".tr,
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Gilroy Medium',
                              color: BlackColor),
                        ),
                        SizedBox(height: Get.height * 0.02),
                        ListView.builder(
                          itemCount: cancelList.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (ctx, i) {
                            return RadioListTile(
                              dense: true,
                              value: i,
                              activeColor: Color(0xFF246BFD),
                              tileColor: BlackColor,
                              selected: true,
                              groupValue: selectedRadioTile,
                              title: Text(
                                cancelList[i]["title"],
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Gilroy Medium',
                                    color: BlackColor),
                              ),
                              onChanged: (val) {
                                setState(() {});
                                selectedRadioTile = val;
                                rejectmsg = cancelList[i]["title"];
                              },
                            );
                          },
                        ),
                        rejectmsg == "Others".tr
                            ? SizedBox(
                          height: 50,
                          width: Get.width * 0.85,
                          child: TextField(
                            controller: note,
                            decoration: InputDecoration(
                                isDense: true,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  borderSide: BorderSide(
                                      color: Color(0xFF246BFD), width: 1),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  borderSide: BorderSide(
                                      color: Color(0xFF246BFD), width: 1),
                                ),
                                hintText: 'Enter reason'.tr,
                                hintStyle: TextStyle(
                                    fontFamily: 'Gilroy Medium',
                                    fontSize: Get.size.height / 55,
                                    color: Colors.grey)),
                          ),
                        )
                            : const SizedBox(),
                        SizedBox(height: Get.height * 0.02),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: Get.width * 0.35,
                              height: Get.height * 0.05,
                              child: ticketbutton(
                                title: "Cancel".tr,
                                bgColor: RedColor,
                                titleColor: Colors.white,
                                ontap: () {
                                  Get.back();
                                },
                              ),
                            ),
                            SizedBox(
                              width: Get.width * 0.35,
                              height: Get.height * 0.05,
                              child: ticketbutton(
                                title: "Confirm".tr,
                                gradient1: gradient.btnGradient,
                                titleColor: Colors.white,
                                ontap: () {
                                  preScriptionControllre.mackDecisionApi(
                                    orderID: orderId,
                                    status: "2",
                                    reson: rejectmsg == "Others".tr
                                        ? note.text
                                        : rejectmsg,
                                  );
                                  Get.back();
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: Get.height * 0.04),
                      ],
                    ),
                  ),
                );
              });
        });
  }

  List cancelList = [
    {"id": 1, "title": "Financing fell through".tr},
    {"id": 2, "title": "Inspection issues".tr},
    {"id": 3, "title": "Change in financial situation".tr},
    {"id": 4, "title": "Title issues".tr},
    {"id": 5, "title": "Seller changes their mind".tr},
    {"id": 6, "title": "Competing offer".tr},
    {"id": 7, "title": "Personal reasons".tr},
    {"id": 8, "title": "Others".tr},
  ];

  ticketbutton(
      {Function()? ontap,
        String? title,
        Color? bgColor,
        titleColor,
        Gradient? gradient1}) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: Get.height * 0.04,
        width: Get.width * 0.40,
        decoration: BoxDecoration(
          color: bgColor,
          gradient: gradient1,
          borderRadius: (BorderRadius.circular(18)),
        ),
        child: Center(
          child: Text(title!,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: titleColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5,
                  fontFamily: 'Gilroy Medium')),
        ),
      ),
    );
  }

  OrderInfo({String? title, subtitle}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title ?? "",
          style: TextStyle(
            fontFamily: FontFamily.gilroyBold,
            fontSize: 13,
            color: greytext,
          ),
        ),
        SizedBox(
          width: 2,
        ),
        Text(
          ":",
          style: TextStyle(
            fontFamily: FontFamily.gilroyBold,
            fontSize: 13,
            color: greytext,
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          subtitle ?? "",
          style: TextStyle(
            fontFamily: FontFamily.gilroyBold,
            fontSize: 14,
            color: Colors.grey,
          ),
        )
      ],
    );
  }

  Paymentinfo({String? text, infotext}) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text!,
              style: TextStyle(
                fontFamily: FontFamily.gilroyMedium,
                color: Colors.grey.shade400,
                fontSize: 14,
              ),
            ),
            Text(
              infotext,
              style: TextStyle(
                fontFamily: FontFamily.gilroyBold,
                color: BlackColor,
                fontSize: 15,
              ),
            ),
          ],
        ),
        SizedBox(height: Get.height * 0.015),
      ],
    );
  }
}
