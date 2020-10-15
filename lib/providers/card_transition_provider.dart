import 'package:flutter/material.dart';
import 'package:rect_getter/rect_getter.dart';

class CardTransitionProvider with ChangeNotifier {
  GlobalKey rectGetterKey = RectGetter.createGlobalKey();

  Rect rect;
  int animationDuration = 500;

  setRect(Rect rect) {
    this.rect = rect;
    notifyListeners();
  }

}