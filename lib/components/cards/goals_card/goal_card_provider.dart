import 'package:flutter/widgets.dart';

enum CardState { FRONT, BACK }

class GoalCardProvider with ChangeNotifier {
  CardState cardState = CardState.FRONT;

  setCardState(CardState cardState) {
    this.cardState = cardState;
    notifyListeners();
  }
}
