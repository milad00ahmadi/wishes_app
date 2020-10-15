import 'package:flutter/material.dart';


import 'package:flutter/cupertino.dart';
import 'package:wishes_app/components/cards/goals_card/progress_painter.dart';
import 'package:wishes_app/models/goal.dart';
import 'package:wishes_app/utils/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wishes_app/utils/util.dart';

class GoalCardFront extends StatefulWidget {
  const GoalCardFront({Key key, this.goal}) : super(key: key);

  final Goal goal;

  @override
  _GoalCardFrontState createState() => _GoalCardFrontState();
}

class _GoalCardFrontState extends State<GoalCardFront>
    with SingleTickerProviderStateMixin {
  AnimationController progressCircleAnimationController;
  Animation<double> progressCircleAnimation;

  @override
  void initState() {
    progressCircleAnimationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    progressCircleAnimation =
        Tween<double>(begin: 0, end: widget.goal.completedPercentage).animate(
            CurvedAnimation(
                parent: progressCircleAnimationController, curve: Curves.ease));
    progressCircleAnimationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    progressCircleAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: 120.h,
        decoration: BoxDecoration(
          color: Colors.white,
            border: Border.all(color: gray1, width: 2),
            borderRadius: BorderRadius.circular(32)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedBuilder(
                    animation: progressCircleAnimationController,
                    builder: (context, _) {
                      return Container(
                        child: CustomPaint(
                          painter: ProgressPainter(
                              color: widget.goal.color,
                              completedPercentage:
                                  progressCircleAnimation.value),
                          child: Container(
                              padding: EdgeInsets.all(16),
                              child: this.widget.goal.icon),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    child: Text(
                      this.widget.goal.name,
                      style: goalCardTitleStyle,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    currencyFormat(widget.goal.progress),
                    style: goalCardAmountStyle.copyWith(
                        color: this.widget.goal.color),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Saved',
                    style: goalCardSavedStyle,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
