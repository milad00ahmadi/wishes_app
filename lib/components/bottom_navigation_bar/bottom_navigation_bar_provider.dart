import 'package:flutter/cupertino.dart';

class BottomNavigationBarProvider with ChangeNotifier {
  int activeIndex = 0;

  void setIndex(int index) {
    this.activeIndex = index;
    notifyListeners();
  }
}
