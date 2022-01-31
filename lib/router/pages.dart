import 'package:get/get.dart';
import 'package:vertical_landing_page/controllers/page_controller.dart';
import 'package:vertical_landing_page/ui/pages/home_page.dart';
import 'package:vertical_landing_page/ui/pages/page_404.dart';

part 'router.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.ROOTROUTE + ":page",
      page: () {
        final pageCtrl = Get.find<PageCtrl>();
        if (Get.parameters["page"] != null) {
          pageCtrl.createScrollController(Get.parameters["page"]!);
        }
        return HomePage();
      },
      transition: Transition.noTransition,
      transitionDuration: 0.milliseconds,
    ),
  ];

  static final unknownPage = GetPage(
    name: '/notfound',
    page: () => Page404(),
    transition: Transition.noTransition,
    transitionDuration: 0.milliseconds,
  );
}
