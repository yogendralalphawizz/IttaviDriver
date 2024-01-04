// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, unnecessary_string_interpolations, sort_child_properties_last, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables

import 'package:deliveryboy/Api/data_store.dart';
import 'package:deliveryboy/controller/dashboard_controller.dart';
import 'package:deliveryboy/controller/notificatio_controller.dart';
import 'package:deliveryboy/helpar/fontfamily_model.dart';
import 'package:deliveryboy/helpar/routes_helper.dart';
import 'package:deliveryboy/screen/login_Screen.dart';
import 'package:deliveryboy/screen/notification_screen.dart';
import 'package:deliveryboy/utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

var currency;

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  DashboardController dashboardController = Get.find();
  NotificationController notificationController = Get.find();

  @override
  void initState() {
    super.initState();
    dashboardController.getDashboardData(
      riderID: getData.read("StoreLogin")["id"],
    );
    currency = getData.read("currency");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(
        backgroundColor: WhiteColor,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        elevation: 0,
        toolbarHeight: 60,
        title: Padding(
          padding: EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello, Welcome Back",
                style: TextStyle(
                  fontFamily: FontFamily.gilroyBold,
                  fontSize: 13,
                  color: greycolor,
                ),
              ),
              Text(
                getData.read("StoreLogin")["title"],
                style: TextStyle(
                  fontFamily: FontFamily.gilroyBold,
                  fontSize: 20,
                  color: BlackColor,
                ),
              ),
              //
            ],
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              notificationController.getNotificationData();
              Get.to(() => NotificationScreen());
            },
            child: Container(
              height: 50,
              width: 50,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(shape: BoxShape.circle, color: bgcolor),
              child: Image.asset(
                "assets/Notification.png",
                color: gradient.defoultColor,
              ),
            ),
          ),
          SizedBox(width: Get.width * 0.025),
          InkWell(
            onTap: () {
              setState(() {
                getData.remove('Firstuser');
                getData.remove('Remember');
                getData.remove("StoreLogin");
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Loginscreen()));
              });
            },
            child: Container(
              height: 50,
              width: 50,
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(shape: BoxShape.circle, color: bgcolor),
              child: Image.asset(
                "assets/log-out.png",
                color: gradient.defoultColor,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return Future.delayed(
            Duration(seconds: 2),
            () {
              dashboardController.getDashboardData(
                riderID: getData.read("StoreLogin")["id"],
              );
            },
          );
        },
        child: SizedBox(
          height: Get.size.height,
          width: Get.size.width,
          child: GetBuilder<DashboardController>(builder: (context) {
            return dashboardController.isLoading
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        SizedBox(height: Get.height * 0.02),
                        GridView.builder(
                          itemCount: dashboardController
                              .dashboardInfo?.reportData.length,
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                            mainAxisExtent: 130,
                          ),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                if (index == 0) {
                                  Get.toNamed(Routes.myBookingScreen);
                                } else if (index == 2) {
                                  Get.toNamed(Routes.myPriscriptionOrder);
                                }
                              },
                              child: Container(
                                child: Row(
                                  children: [
                                    SizedBox(width: 15),
                                    SizedBox(
                                      width: Get.width * 0.37,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            dashboardController
                                                    .dashboardInfo
                                                    ?.reportData[index]
                                                    .reportData
                                                    .toString() ??
                                                "",
                                            maxLines: 1,
                                            style: TextStyle(
                                              color: WhiteColor,
                                              fontFamily: FontFamily.gilroyBold,
                                              fontSize: 20,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Text(
                                            dashboardController.dashboardInfo
                                                    ?.reportData[index].title ??
                                                "",
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: WhiteColor,
                                              fontFamily:
                                                  FontFamily.gilroyExtraBold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                  color: WhiteColor,
                                  // border: Border.all(color: ),
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    image: AssetImage("assets/dImage.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  );
          }),
        ),
      ),
    );
  }
}
