// ignore_for_file: prefer_const_constructors

import 'package:deliveryboy/onbording_screen.dart';
import 'package:deliveryboy/screen/myorder_screen.dart';
import 'package:deliveryboy/screen/orderdetails_screen.dart';
import 'package:deliveryboy/screen/subscription_order.dart';
import 'package:deliveryboy/screen/subscriptiondetails_screen.dart';
import 'package:get/get.dart';

class Routes {
  static String initial = "/";
  static String myBookingScreen = "/myBookingScreen";
  static String orderDetailsScreen = "/orderDetailsScreen";
  static String myPriscriptionOrder = "/MyPriscriptionOrder";
  static String myPriscriptionInfo = "/MyPriscriptionInfo";
}

final getPages = [
  GetPage(
    name: Routes.initial,
    page: () => onbording(),
  ),
  GetPage(
    name: Routes.myBookingScreen,
    page: () => MyBookingScreen(isBack: "1"),
  ),
  GetPage(
    name: Routes.orderDetailsScreen,
    page: () => OrderdetailsScreen(),
  ),
  GetPage(
    name: Routes.myPriscriptionOrder,
    page: () => MyPriscriptionOrder(isBack: "1"),
  ),
  GetPage(
    name: Routes.myPriscriptionInfo,
    page: () => MyPriscriptionInfo(),
  ),
];
