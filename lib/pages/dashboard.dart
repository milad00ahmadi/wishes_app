import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:wishes_app/components/cards/goals_card/goal_card.dart';
import 'package:wishes_app/components/cards/saved_card.dart';
import 'package:wishes_app/components/menus/home_menu.dart';
import 'package:wishes_app/data/goal_data.dart';
import 'package:wishes_app/utils/style.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.none,
      child: ListView(
        padding: EdgeInsets.only(left: 28, right: 28, top: 0),
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        children: [
          Container(
              padding: EdgeInsets.only(
                top: 28,
                bottom: 28
              ),
              child: HomeMenu()),
          SavedCard(
            amount: 400,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              'Your Goals',
              style: homeTitleStyle,
            ),
          ),
          // fill the goals list with our mock data
          for (var i = 0; i < goals.length; i++)
            GoalCard(
              goal: goals[i],
            ),
        ],
      ),
    );
  }
}
