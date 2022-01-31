// import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universal_html/html.dart' as html;

class PageCtrl extends GetxController {
  PageController scrollController = PageController();

  List<String> _pages = ["home", "about", "pricing", "contact", "location"];

  int _currentIndex = 0;

  createScrollController(String routeName) {
    this.scrollController =
        new PageController(initialPage: getPageIndex(routeName));
    html.document.title = _pages[getPageIndex(routeName)].toUpperCase();
    this.scrollController.addListener(() {
      final index = (this.scrollController.page ?? 0).round();
      if (index != _currentIndex) {
        html.window.history.replaceState(null, 'none', '#/${_pages[index]}');
        html.document.title = _pages[index].toUpperCase();
        _currentIndex = index;
      }
    });
  }

  int getPageIndex(String routeName) {
    return (_pages.indexOf(routeName) == -1 ? 0 : _pages.indexOf(routeName));
  }

  goTo(int index) {
    // final routeName = _pages[index];

    html.window.history.replaceState(null, 'none', '#/${_pages[index]}');
    html.document.title = _pages[index].toUpperCase();

    scrollController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
