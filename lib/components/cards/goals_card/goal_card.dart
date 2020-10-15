import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wishes_app/components/cards/goals_card/goal_card_back.dart';
import 'package:wishes_app/components/cards/goals_card/goal_card_front.dart';
import 'package:wishes_app/models/goal.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math' as Math;

class GoalCard extends StatefulWidget {
  const GoalCard({Key key, this.goal}) : super(key: key);

  final Goal goal;

  @override
  _GoalCardState createState() => _GoalCardState();
}

class _GoalCardState extends State<GoalCard>
    with SingleTickerProviderStateMixin {
  AnimationController flipAnimationController;
  Animation<double> flipAnimation;
  AnimationStatus flipAnimationStatus = AnimationStatus.dismissed;

  @override
  void initState() {
    flipAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 350));
    flipAnimation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(curve: Curves.ease, parent: flipAnimationController))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        this.flipAnimationStatus = status;
      });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (flipAnimationStatus == AnimationStatus.dismissed) {
          flipAnimationController.forward();
        } else {
          flipAnimationController.reverse();
        }
      },
      child: Transform(
        alignment: FractionalOffset.center,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..setRotationX(-flipAnimation.value * Math.pi),
        child: Container(
          height: 120.h,
          child: flipAnimationController.value >= 0.5
              ? GoalCardBack(goal: widget.goal,)
              : GoalCardFront(goal: widget.goal),
        ),
      ),
    );
  }
}
