import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vertical_landing_page/controllers/page_controller.dart';
import 'package:vertical_landing_page/ui/shared/custom_app_menu.dart';
import 'package:vertical_landing_page/ui/views/about_view.dart';
import 'package:vertical_landing_page/ui/views/contact_view.dart';
import 'package:vertical_landing_page/ui/views/home_view.dart';
import 'package:vertical_landing_page/ui/views/location_view.dart';
import 'package:vertical_landing_page/ui/views/pricing_view.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: buildBoxDecoration(),
        child: Stack(
          children: [
            _HomeBody(),
            Positioned(
              child: CustomAppMenu(),
              right: 20,
              top: 20,
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => const BoxDecoration(
        gradient: LinearGradient(
            colors: [
              Colors.pink,
              Colors.purpleAccent,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.5, 0.5]),
      );
}

class _HomeBody extends StatelessWidget {
  _HomeBody({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final pageCtrl = Get.find<PageCtrl>();
    return PageView(
      scrollBehavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      }),
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      controller: pageCtrl.scrollController,
      children: [
        HomeView(),
        AboutView(),
        PricingView(),
        ContactView(),
        LocationView(),
      ],
    );
  }
}
