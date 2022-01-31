import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vertical_landing_page/controllers/page_controller.dart';
import 'package:vertical_landing_page/router/pages.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vertical Landing Page',
      initialRoute: Routes.ROOTROUTE + "about",
      getPages: AppPages.pages,
      unknownRoute: AppPages.unknownPage,
      initialBinding: BindingsBuilder(() => {Get.put(PageCtrl())}),
    );
  }
}
