// ignore_for_file: avoid_print, unused_local_variable, prefer_typing_uninitialized_variables, must_be_immutable, prefer_const_constructors_in_immutables, unnecessary_null_comparison, prefer_interpolation_to_compose_strings
import 'package:deliveryboy/utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';

class Loream extends StatefulWidget {
  String? title;
  String? discription;
  Loream({this.title, this.discription, super.key});
  @override
  State<Loream> createState() => _LoreamState();
}

class _LoreamState extends State<Loream> {
  // String title = Get.arguments["title"];
  // String discription = Get.arguments["discription"];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(
        backgroundColor: bgcolor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: BlackColor,
          ),
        ),
        title: Text(
          widget.title ?? "",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w900,
            fontFamily: 'Gilroy Medium',
            color: BlackColor,
          ),
        ),
      ),
      body: SizedBox(
        height: Get.size.height,
        width: Get.size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: Get.height / 30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.size.width / 20),
                child: Column(children: [
                  (widget.discription != null && widget.discription!.isNotEmpty)
                      ? HtmlWidget(
                          widget.discription ?? "",
                          textStyle: TextStyle(
                              color: BlackColor,
                              fontSize: Get.height / 50,
                              fontFamily: 'Gilroy Normal'),
                        )
                      : Text(
                          "",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: Get.height / 50,
                              fontFamily: 'Gilroy Normal'),
                        ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
