import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vertical_landing_page/router/pages.dart';
import 'package:vertical_landing_page/ui/shared/custom_flat_button.dart';

class Page404 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "404",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "No se encontró la página",
              style: TextStyle(fontSize: 20),
            ),
            CustomFlatButton(
              text: "Regresar",
              onPressed: () => Get.toNamed(Routes.ROOTROUTE),
            )
          ],
        ),
      ),
    );
  }
}
