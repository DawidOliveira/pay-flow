import 'package:flutter/cupertino.dart';

class HomeController {
  final currentPageNotifier = ValueNotifier<int>(0);

  int get currentPage => currentPageNotifier.value;

  void setPage(int index) {
    currentPageNotifier.value = index;
  }
}
