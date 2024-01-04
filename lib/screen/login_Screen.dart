// ignore_for_file: non_constant_identifier_names, unused_field, prefer_const_constructors, unnecessary_brace_in_string_interps, avoid_print, file_names

import 'dart:convert';
import 'dart:io';

import 'package:deliveryboy/Api/Config.dart';
import 'package:deliveryboy/Api/data_store.dart';
import 'package:deliveryboy/helpar/fontfamily_model.dart';
import 'package:deliveryboy/screen/bottombar_screen.dart';
import 'package:deliveryboy/utils/Colors.dart';
import 'package:deliveryboy/utils/Custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:onesignal_flutter/onesignal_flutter.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Mobile = TextEditingController();
  final Email = TextEditingController();
  final password = TextEditingController();
  bool _obscureText = true;
  bool isChecked = false;
  String loginpage = "";
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        exit(0);
      },
      child: Scaffold(
        body: Container(
          color: transparent,
          height: Get.height,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Stack(
                children: [
                  Container(
                    height: Get.height * 0.4,
                    width: double.infinity,
                    decoration: BoxDecoration(gradient: gradient.btnGradient),
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: Get.height * 0.13,
                        ),
                        Text(
                          "Welcome Back".tr,
                          style: TextStyle(
                            color: WhiteColor,
                            fontFamily: FontFamily.gilroyBold,
                            fontSize: 25,
                            letterSpacing: 1.1,
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        Text(
                          "Sign in to start".tr,
                          style: TextStyle(
                            color: WhiteColor,
                            fontFamily: FontFamily.gilroyMedium,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Positioned(
                  //   top: 10,
                  //   right: 0,
                  //   child: SizedBox(
                  //     height: Get.size.height * 0.23,
                  //     width: Get.size.width * 0.7,
                  //     child: Image.asset(
                  //       "assets/loginImage.png",
                  //       height: Get.size.height * 0.2,
                  //       width: Get.size.width * 0.6,
                  //     ),
                  //   ),
                  // )
                ],
              ),
              Positioned(
                left: 0,
                right: 0,
                top: Get.height * 0.32,
                child: Form(
                  key: _formKey,
                  child: Container(
                    height: Get.height,
                    width: Get.width * 0.9,
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: WhiteColor),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Sign in !",
                          style: TextStyle(
                            color: BlackColor,
                            fontFamily: "Gilroy Bold",
                            fontSize: 22,
                          ),
                        ),
                        SizedBox(height: Get.height * 0.005),
                        Text(
                          "Welcome back you’ve been missed! ",
                          style: TextStyle(
                            color: BlackColor,
                            fontFamily: "Gilroy Medium",
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: Get.height * 0.02),
                        passwordtextfield(
                          controller: Email,
                          lebaltext: "Enter your email address",
                          obscureText: false,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email address';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: Get.height * 0.03),
                        passwordtextfield(
                          lebaltext: "Password",
                          controller: password,
                          obscureText: _obscureText,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Password';
                            }
                            return null;
                          },
                          suffixIcon: Container(
                            height: 40,
                            width: 40,
                            alignment: Alignment.center,
                            child: InkWell(
                              onTap: () {
                                _toggle();
                              },
                              child: !_obscureText
                                  ? Icon(
                                      Icons.visibility,
                                      color: greyColor,
                                    )
                                  : Icon(
                                      Icons.visibility_off,
                                      color: greycolor,
                                    ),
                            ),
                          ),
                        ),
                        SizedBox(height: Get.height * 0.01),
                        Row(
                          children: [
                            Row(
                              children: [
                                Theme(
                                  data: ThemeData(
                                      unselectedWidgetColor: greycolor),
                                  child: Checkbox(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4)),
                                    value: isChecked,
                                    activeColor: BlackColor,
                                    checkColor: WhiteColor,
                                    onChanged: (value) {
                                      setState(() {
                                        isChecked = value!;
                                        save("Remember", value);
                                      });
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "Remember Me",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: "Gilroy Medium",
                                      color: BlackColor),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: Get.height * 0.02),
                        GestButton(
                          Width: Get.size.width,
                          height: 50,
                          buttoncolor: blueColor,
                          margin: EdgeInsets.only(top: 15, left: 30, right: 30),
                          buttontext: "Login",
                          style: TextStyle(
                            fontFamily: FontFamily.gilroyBold,
                            color: WhiteColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          onclick: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              login(Email.text, password.text);
                              initPlatformState();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget passwordtextfield(
      {Widget? suffixIcon,
      String? lebaltext,
      double? width,
      bool? obscureText,
      String? Function(String?)? validator,
      TextEditingController? controller}) {
    return Container(
      width: width,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText!,
        readOnly: false,
        validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: TextStyle(
          fontSize: 16,
          fontFamily: "Gilroy Medium",
          color: BlackColor,
        ),
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          labelText: lebaltext,
          labelStyle: const TextStyle(color: Colors.grey, fontSize: 16),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: gradient.defoultColor),
            borderRadius: BorderRadius.circular(15),
          ),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: greyColor.withOpacity(0.5),
              ),
              borderRadius: BorderRadius.circular(15)),
        ),
      ),
    );
  }

  login(String email, String password) async {
    try {
      Map map = {"email": email, "password": password};
      Uri uri = Uri.parse(Config.path + Config.loginApi);
      var response = await http.post(uri, body: jsonEncode(map));
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        loginpage = result["Result"];
        save("Firstuser", true);
        setState(() {
          save("StoreLogin", result["StoreLogin"]);
          save("currency", result["currency"]);
        });
        if (loginpage == "true") {
          Get.offAll(() => BottoBarScreen());
          OneSignal.shared
              .sendTag("rider_id", getData.read("StoreLogin")["id"]);
          showToastMessage(result["ResponseMsg"]);
        } else {
          showToastMessage(result["ResponseMsg"]);
        }
      }
      // update();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> initPlatformState() async {
    OneSignal.shared.setAppId(Config.oneSignel);
    OneSignal.shared
        .promptUserForPushNotificationPermission()
        .then((accepted) {});
    OneSignal.shared.setPermissionObserver((OSPermissionStateChanges changes) {
      print("Accepted OSPermissionStateChanges : $changes");
    });
    // print("--------------__uID : ${getData.read("UserLogin")["id"]}");
  }
}
