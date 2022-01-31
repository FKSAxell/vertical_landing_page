import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vertical_landing_page/router/pages.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vertical Landing Page',
      initialRoute: Routes.ROOTROUTE + "home",
      getPages: AppPages.pages,
      unknownRoute: AppPages.unknownPage,
    );
  }
}
