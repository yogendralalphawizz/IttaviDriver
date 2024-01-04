// ignore_for_file: unused_local_variable

import 'package:deliveryboy/controller/dashboard_controller.dart';
import 'package:deliveryboy/controller/myorder_controller.dart';
import 'package:deliveryboy/controller/notificatio_controller.dart';
import 'package:deliveryboy/controller/pagelist_controller.dart';
import 'package:deliveryboy/controller/priscription_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => DashboardController());
  Get.lazyPut(() => MyOrderController());
  Get.lazyPut(() => PreScriptionControllre());
  Get.lazyPut(() => NotificationController());
  Get.lazyPut(() => PageListController());
}
