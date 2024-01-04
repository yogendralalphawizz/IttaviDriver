// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:deliveryboy/Api/Config.dart';
import 'package:deliveryboy/model/dashboard_info.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;

class DashboardController extends GetxController implements GetxService {
  DashboardInfo? dashboardInfo;
  bool isLoading = false;
  getDashboardData({String? riderID}) async {
    try {
      Map map = {
        "rider_id": riderID,
      };
      Uri uri = Uri.parse(Config.path + Config.dashboard);
      var response = await http.post(
        uri,
        body: jsonEncode(map),
      );
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        print(result.toString());
        dashboardInfo = DashboardInfo.fromJson(result);
      }
      isLoading = true;
      update();
    } catch (e) {
      print(e.toString());
    }
  }
}
