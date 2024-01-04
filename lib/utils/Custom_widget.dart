// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, non_constant_identifier_names, file_names, sort_child_properties_last, no_leading_underscores_for_local_identifiers, prefer_interpolation_to_compose_strings, avoid_print

import 'package:deliveryboy/Api/data_store.dart';
import 'package:deliveryboy/controller/dashboard_controller.dart';
import 'package:deliveryboy/helpar/fontfamily_model.dart';
import 'package:deliveryboy/screen/bottombar_screen.dart';
import 'package:deliveryboy/utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

GestButton({
  String? buttontext,
  Function()? onclick,
  double? Width,
  double? height,
  Color? buttoncolor,
  EdgeInsets? margin,
  TextStyle? style,
}) {
  return GestureDetector(
    onTap: onclick,
    child: Container(
      height: height,
      width: Width,
      // margin: EdgeInsets.only(top: 15, left: 30, right: 30),
      margin: margin,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: gradient.btnGradient,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: const Offset(
              0.5,
              0.5,
            ),
            blurRadius: 1,
          ), //BoxShadow
        ],
      ),
      child: Text(buttontext!, style: style),
    ),
  );
}

showToastMessage(message) {
  Fluttertoast.showToast(
    msg: message,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: gradient.defoultColor,
    textColor: Colors.white,
    fontSize: 14.0,
  );
}

bgdecoration({Widget? child, EdgeInsetsGeometry? margin}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    margin: margin,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300)),
    child: child,
  );
}

Future Dialogbox() {
  DashboardController dashboardController = DashboardController();
  return Get.defaultDialog(
    title: "",
    content: WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Container(
        height: Get.height * 0.42,
        width: Get.size.width,
        child: Column(
          children: [
            Image.asset(
              "assets/successfull.png",
              height: 150,
              width: 150,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  "Delivery Successfully!".tr,
                  style: TextStyle(
                    color: gradient.defoultColor,
                    fontFamily: FontFamily.gilroyBold,
                    fontSize: 20,
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            Text(
              "You’re successfully sent the request",
              maxLines: 3,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: FontFamily.gilroyMedium,
                fontSize: 15,
                color: BlackColor,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                dashboardController.getDashboardData(
                  riderID: getData.read("StoreLogin")["id"],
                );
                Get.back();
                Get.to(() => BottoBarScreen());
              },
              child: Container(
                height: 60,
                margin: EdgeInsets.all(15),
                alignment: Alignment.center,
                child: Text(
                  "Home".tr,
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
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: WhiteColor,
        ),
      ),
    ),
  );
}

// Future completedBottomSheet({String? oID}) {
//   String imageEncoded = "";
//   GlobalKey<SfSignaturePadState> _signaturePadKey = GlobalKey();
//   PreScriptionControllre preScriptionControllre = Get.find();
//   return Get.bottomSheet(
//     enableDrag: true,
//     Container(
//       height: 300,
//       width: Get.size.width,
//       child: Column(
//         children: [
//           SizedBox(
//             height: 10,
//           ),
//           Stack(
//             children: [
//               Container(
//                 alignment: Alignment.center,
//                 margin: EdgeInsets.symmetric(horizontal: 10),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(15),
//                   child: SfSignaturePad(
//                     key: _signaturePadKey,
//                     minimumStrokeWidth: 1,
//                     maximumStrokeWidth: 3,
//                     strokeColor: Colors.blue,
//                     backgroundColor: WhiteColor,
//                     onDrawEnd: () async {
//                       ui.Image signatureData =
//                           await _signaturePadKey.currentState!.toImage();
//                       ByteData? byteData = await signatureData.toByteData(
//                           format: ui.ImageByteFormat.png);
//                       imageEncoded =
//                           base64.encode(byteData!.buffer.asUint8List());
//                       print("Encoded: $imageEncoded");
//                     },
//                   ),
//                 ),
//                 height: 200,
//                 width: Get.size.width,
//                 decoration: BoxDecoration(
//                   color: WhiteColor,
//                   border: Border.all(color: Colors.grey.shade300),
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//               ),
//               Positioned(
//                 bottom: 10,
//                 left: 20,
//                 child: InkWell(
//                   onTap: () {
//                     _signaturePadKey.currentState?.clear();
//                   },
//                   child: Container(
//                     height: 40,
//                     width: 100,
//                     alignment: Alignment.center,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Image.asset(
//                           "assets/Thrash.png",
//                           height: 20,
//                           width: 20,
//                           color: WhiteColor,
//                         ),
//                         SizedBox(
//                           width: 4,
//                         ),
//                         Text(
//                           "Clear",
//                           style: TextStyle(
//                             fontFamily: FontFamily.gilroyBold,
//                             color: WhiteColor,
//                           ),
//                         ),
//                       ],
//                     ),
//                     decoration: BoxDecoration(
//                       gradient: gradient.btnGradient,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 15,
//           ),
//           GestButton(
//             Width: Get.size.width,
//             height: 50,
//             buttoncolor: blueColor,
//             margin: EdgeInsets.only(top: 15, left: 30, right: 30),
//             buttontext: "Delivered",
//             style: TextStyle(
//               fontFamily: FontFamily.gilroyBold,
//               color: WhiteColor,
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//             ),
//             onclick: () {
//               if (imageEncoded != "") {
//                 preScriptionControllre.completeOrderApi(
//                   orderID: oID,
//                   image: imageEncoded,
//                 );
//                 imageEncoded = "";
//               } else {
//                 showToastMessage("Please Signature");
//               }
//             },
//           ),
//         ],
//       ),
//       decoration: BoxDecoration(
//         color: WhiteColor,
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(30),
//           topRight: Radius.circular(30),
//         ),
//       ),
//     ),
//   );
// }

// Future normalCompletedBottomSheet({String? oID}) {
//   String imageEncoded = "";
//   GlobalKey<SfSignaturePadState> _signaturePadKey = GlobalKey();
//   MyOrderController myOrderController = Get.find();
//   return Get.bottomSheet(
//     enableDrag: true,
//     Container(
//       height: 300,
//       width: Get.size.width,
//       child: Column(
//         children: [
//           SizedBox(
//             height: 10,
//           ),
//           Stack(
//             children: [
//               Container(
//                 alignment: Alignment.center,
//                 margin: EdgeInsets.symmetric(horizontal: 10),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(15),
//                   child: SfSignaturePad(
//                     key: _signaturePadKey,
//                     minimumStrokeWidth: 1,
//                     maximumStrokeWidth: 3,
//                     strokeColor: Colors.blue,
//                     backgroundColor: WhiteColor,
//                     onDrawEnd: () async {
//                       ui.Image signatureData =
//                           await _signaturePadKey.currentState!.toImage();
//                       ByteData? byteData = await signatureData.toByteData(
//                           format: ui.ImageByteFormat.png);
//                       imageEncoded =
//                           base64.encode(byteData!.buffer.asUint8List());
//                     },
//                   ),
//                 ),
//                 height: 200,
//                 width: Get.size.width,
//                 decoration: BoxDecoration(
//                   color: WhiteColor,
//                   border: Border.all(color: Colors.grey.shade300),
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//               ),
//               Positioned(
//                 bottom: 10,
//                 left: 20,
//                 child: InkWell(
//                   onTap: () {
//                     _signaturePadKey.currentState?.clear();
//                   },
//                   child: Container(
//                     height: 40,
//                     width: 100,
//                     alignment: Alignment.center,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Image.asset(
//                           "assets/Thrash.png",
//                           height: 20,
//                           width: 20,
//                           color: WhiteColor,
//                         ),
//                         SizedBox(
//                           width: 4,
//                         ),
//                         Text(
//                           "Clear",
//                           style: TextStyle(
//                             fontFamily: FontFamily.gilroyBold,
//                             color: WhiteColor,
//                           ),
//                         ),
//                       ],
//                     ),
//                     decoration: BoxDecoration(
//                       gradient: gradient.btnGradient,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 15,
//           ),
//           GestButton(
//             Width: Get.size.width,
//             height: 50,
//             buttoncolor: blueColor,
//             margin: EdgeInsets.only(top: 15, left: 30, right: 30),
//             buttontext: "Delivered",
//             style: TextStyle(
//               fontFamily: FontFamily.gilroyBold,
//               color: WhiteColor,
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//             ),
//             onclick: () {
//               if (imageEncoded != "") {
//                 myOrderController.completeOrderApi(
//                   orderID: oID,
//                   image: imageEncoded,
//                 );
//                 imageEncoded = "";
//               } else {
//                 showToastMessage("Please Signature");
//               }
//             },
//           ),
//         ],
//       ),
//       decoration: BoxDecoration(
//         color: WhiteColor,
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(30),
//           topRight: Radius.circular(30),
//         ),
//       ),
//     ),
//   );
// }
