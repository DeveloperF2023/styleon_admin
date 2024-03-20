import 'dart:io';

import 'package:admin/presentation/widgets/global/text_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertExitApp() {
   Get.defaultDialog(title: "32".tr,middleText: "33".tr,actions: [
    ElevatedButton(onPressed: (){
      exit(0);
    }, child: TextApp(text: '34'.tr)),
    ElevatedButton(onPressed: (){
      Get.back();
    }, child: TextApp(text: '35'.tr)),
  ]);
   return Future.value(true);
}