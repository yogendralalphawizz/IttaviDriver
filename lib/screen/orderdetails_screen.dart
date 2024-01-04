// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, sort_child_properties_last, must_be_immutable, unnecessary_brace_in_string_interps, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, prefer_final_fields
import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:deliveryboy/Api/Config.dart';
import 'package:deliveryboy/controller/myorder_controller.dart';
import 'package:deliveryboy/helpar/fontfamily_model.dart';
import 'package:deliveryboy/screen/dashboard_screen.dart';
import 'package:deliveryboy/utils/Colors.dart';
import 'package:deliveryboy/utils/Custom_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import 'dart:ui' as ui;

class FullScreenImage extends StatelessWidget {
  String? imageUrl;
  String? tag;
  FullScreenImage({this.imageUrl, this.tag});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: GestureDetector(
        child: Center(
          child: Hero(
            tag: tag ?? "",
            child: CachedNetworkImage(
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.contain,
              imageUrl: imageUrl ?? "",
            ),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

class OrderdetailsScreen extends StatefulWidget {
  const OrderdetailsScreen({super.key});

  @override
  State<OrderdetailsScreen> createState() => _OrderdetailsScreenState();
}

class _OrderdetailsScreenState extends State<OrderdetailsScreen> {
  MyOrderController myOrderController = Get.find();
  String oID = Get.arguments["oID"];

  GlobalKey<SfSignaturePadState> _signaturePadKey = GlobalKey();
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
      bottomNavigationBar: GetBuilder<MyOrderController>(
        builder: (controller) {
          return myOrderController.orderInformetionInfo?.orderdata.flowId == "4"
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
                                  "$currency${myOrderController.orderInformetionInfo?.orderdata.orderTotal}",
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
                              if (imageEncoded != "") {
                                myOrderController.completeOrderApi(
                                  orderID: oID,
                                );
                                imageEncoded = "";
                              } else {
                                showToastMessage("Please Signature");
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
              : myOrderController.orderInformetionInfo?.orderdata.flowId == "3"
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
                                      "$currency${myOrderController.orderInformetionInfo?.orderdata.orderTotal}",
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
                                  myOrderController.mackDecisionApi(
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
                  : SizedBox();
        },
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: GetBuilder<MyOrderController>(builder: (context) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: myOrderController.isLoading
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: Get.height * 0.02),
                      myOrderController.orderInformetionInfo!.orderdata
                              .orderProducts.isNotEmpty
                          ? Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 12),
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
                                      itemCount: myOrderController
                                          .orderInformetionInfo
                                          ?.orderdata
                                          .orderProducts
                                          .length,
                                      padding: EdgeInsets.zero,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () {
                                            myOrderController
                                                .changeIndexProductWise(
                                                    index: index);
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
                                                        BorderRadius.circular(
                                                            5),
                                                    child: FadeInImage
                                                        .assetNetwork(
                                                      placeholder:
                                                          "assets/ezgif.com-crop.gif",
                                                      placeholderCacheHeight:
                                                          80,
                                                      placeholderCacheWidth:
                                                          100,
                                                      placeholderFit:
                                                          BoxFit.cover,
                                                      image:
                                                          "${Config.imageurl}${myOrderController.orderInformetionInfo?.orderdata.orderProducts[index].productImage}",
                                                      height: 80,
                                                      width: 100,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 100,
                                                  child: Text(
                                                    "${myOrderController.orderInformetionInfo?.orderdata.orderProducts[index].productName}",
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
                                              ],
                                            ),
                                            decoration: BoxDecoration(
                                              border: myOrderController
                                                          .currentIndex ==
                                                      index
                                                  ? Border.all(
                                                      color:
                                                          gradient.defoultColor)
                                                  : Border.all(
                                                      color:
                                                          Colors.grey.shade300),
                                              // color: myOrderController
                                              //             .currentIndex ==
                                              //         index
                                              //     ? Color(0xffdaedfd)
                                              //     : WhiteColor,
                                              color: WhiteColor,
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : SizedBox(),
                      SizedBox(height: Get.height * 0.02),
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
                                        "${currency}${myOrderController.orderInformetionInfo?.orderdata.orderProducts[myOrderController.currentIndex].productPrice}",
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
                                        "${currency}${myOrderController.orderInformetionInfo?.orderdata.orderProducts[myOrderController.currentIndex].productPrice}",
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
                                        "${myOrderController.orderInformetionInfo?.orderdata.orderProducts[myOrderController.currentIndex].productType}",
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
                                        "${myOrderController.orderInformetionInfo?.orderdata.orderProducts[myOrderController.currentIndex].productQuantity}",
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
                                  "${currency}${myOrderController.orderInformetionInfo?.orderdata.orderSubTotal}",
                            ),
                            SizedBox(
                              height: 13,
                            ),
                            OrderInfo(
                              title: "Delivery Charge".tr,
                              subtitle:
                                  "${currency}${myOrderController.orderInformetionInfo?.orderdata.deliveryCharge}",
                            ),
                            SizedBox(
                              height: 13,
                            ),
                            OrderInfo(
                              title: "Store Charge".tr,
                              subtitle:
                                  "${currency}${myOrderController.orderInformetionInfo?.orderdata.storeCharge}",
                            ),
                            // SizedBox(
                            //   height: 13,
                            // ),

                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.start,
                            //   children: [
                            //     Text(
                            //       "Store Address",
                            //       style: TextStyle(
                            //         fontFamily: FontFamily.gilroyBold,
                            //         fontSize: 13,
                            //         color: greytext,
                            //       ),
                            //     ),
                            //     SizedBox(
                            //       width: 2,
                            //     ),
                            //     Text(
                            //       ":",
                            //       style: TextStyle(
                            //         fontFamily: FontFamily.gilroyBold,
                            //         fontSize: 13,
                            //         color: greytext,
                            //       ),
                            //     ),
                            //     SizedBox(
                            //       width: 5,
                            //     ),
                            //     SizedBox(
                            //       width: Get.size.width * 0.7,
                            //       child: Text(
                            //         "${myOrderController.nDetailsInfo?.orderProductList.storeAddress}",
                            //         maxLines: 1,
                            //         style: TextStyle(
                            //           fontFamily: FontFamily.gilroyBold,
                            //           fontSize: 14,
                            //           color: Colors.grey,
                            //           overflow: TextOverflow.ellipsis,
                            //         ),
                            //       ),
                            //     )
                            //   ],
                            // ),

                            myOrderController.orderInformetionInfo?.orderdata
                                        .couponAmount !=
                                    "0"
                                ? SizedBox(
                                    height: 13,
                                  )
                                : SizedBox(),
                            myOrderController.orderInformetionInfo?.orderdata
                                        .couponAmount !=
                                    "0"
                                ? OrderInfo(
                                    title: "Coupon Amount".tr,
                                    subtitle:
                                        "${currency}${myOrderController.orderInformetionInfo?.orderdata.couponAmount}",
                                  )
                                : SizedBox(),
                            myOrderController.orderInformetionInfo?.orderdata
                                        .wallAmt !=
                                    "0"
                                ? SizedBox(
                                    height: 13,
                                  )
                                : SizedBox(),
                            myOrderController.orderInformetionInfo?.orderdata
                                        .wallAmt !=
                                    "0"
                                ? OrderInfo(
                                    title: "Wallet Amount".tr,
                                    subtitle:
                                        "${currency}${myOrderController.orderInformetionInfo?.orderdata.wallAmt}",
                                  )
                                : SizedBox(),
                            SizedBox(
                              height: 13,
                            ),
                            OrderInfo(
                              title: "Total".tr,
                              subtitle:
                                  "${currency}${myOrderController.orderInformetionInfo?.orderdata.orderTotal}",
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
                                        myOrderController.orderInformetionInfo
                                                ?.orderdata.pMethodName ??
                                            "",
                                        style: TextStyle(
                                          fontFamily: FontFamily.gilroyBold,
                                          fontSize: 14,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Text(
                                        "(${myOrderController.orderInformetionInfo?.orderdata.orderTransactionId})",
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
                            OrderInfo(
                              title: "Delivery time".tr,
                              subtitle: myOrderController.orderInformetionInfo
                                  ?.orderdata.deliveryTimeslot,
                            ),
                            // : SizedBox(),
                            SizedBox(
                              height: 10,
                            ),
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
                                        myOrderController.orderInformetionInfo
                                                ?.orderdata.customerAddress ??
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
                      myOrderController.orderInformetionInfo?.orderdata
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
                                    myOrderController.orderInformetionInfo
                                            ?.orderdata.additionalNote ??
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
                      myOrderController
                                  .orderInformetionInfo?.orderdata.flowId ==
                              "4"
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
          );
        }),
      ),
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
}
