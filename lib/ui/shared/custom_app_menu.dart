import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vertical_landing_page/controllers/page_controller.dart';
import 'package:vertical_landing_page/ui/shared/custom_menu_item.dart';

class CustomAppMenu extends StatefulWidget {
  CustomAppMenu({Key? key}) : super(key: key);

  @override
  State<CustomAppMenu> createState() => _CustomAppMenuState();
}

class _CustomAppMenuState extends State<CustomAppMenu>
    with SingleTickerProviderStateMixin {
  bool isOpen = false;
  late AnimationController animationCtrl;
  @override
  void initState() {
    super.initState();
    animationCtrl = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
  }

  @override
  Widget build(BuildContext context) {
    final pageCtrl = Get.find<PageCtrl>();
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          if (isOpen) {
            animationCtrl.reverse();
          } else {
            animationCtrl.forward();
          }
          setState(() {
            isOpen = !isOpen;
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          width: 150,
          height: isOpen ? 308 : 50,
          color: Colors.black,
          child: Column(
            children: [
              _MenuTitle(isOpen: isOpen, animationCtrl: animationCtrl),
              if (isOpen) ...[
                CustomMenuItem(
                  text: "Home",
                  onPressed: () => pageCtrl.goTo(0),
                ),
                CustomMenuItem(
                  text: "About",
                  onPressed: () => pageCtrl.goTo(1),
                ),
                CustomMenuItem(
                  text: "Pricing",
                  onPressed: () => pageCtrl.goTo(2),
                ),
                CustomMenuItem(
                  text: "Contact",
                  onPressed: () => pageCtrl.goTo(3),
                ),
                CustomMenuItem(
                  text: "Location",
                  onPressed: () => pageCtrl.goTo(4),
                ),
                SizedBox(
                  height: 8,
                )
              ]
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuTitle extends StatelessWidget {
  const _MenuTitle({
    Key? key,
    required this.isOpen,
    required this.animationCtrl,
  }) : super(key: key);

  final bool isOpen;
  final AnimationController animationCtrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 50,
      child: Row(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            width: isOpen ? 45 : 0,
            // color: Colors.green,
          ),
          Text(
            "Menú",
            style: GoogleFonts.roboto(color: Colors.white, fontSize: 18),
          ),
          Spacer(),
          AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: animationCtrl,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
