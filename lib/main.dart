import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api/routes/app_pages.dart';
import 'package:getx_api/routes/app_routes.dart';

void main() {
  runApp(GetMaterialApp(
    initialRoute: AppRoutes.home,
    getPages: AppPages.pages,
    debugShowCheckedModeBanner: false,
  ));
}
