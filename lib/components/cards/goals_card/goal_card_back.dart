import 'package:flutter/material.dart';
import 'package:wishes_app/components/progress_bar/progress_bar.dart';
import 'package:wishes_app/models/goal.dart';
import 'package:wishes_app/utils/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wishes_app/utils/util.dart';
import 'dart:math' as Math;

class GoalCardBack extends StatefulWidget {
  const GoalCardBack({Key key, this.goal}) : super(key: key);

  final Goal goal;

  @override
  _GoalCardBackState createState() => _GoalCardBackState();
}

class _GoalCardBackState extends State<GoalCardBack> {
  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: FractionalOffset.center,
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001)
        ..setRotationX(1 * Math.pi),
      child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Container(
            height: 120.h,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: primaryColor, borderRadius: BorderRadius.circular(32)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                buildSaved(),
                Expanded(
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: ProgressBar(
                        value: widget.goal.completedPercentage,
                      )),
                ),
                buildTarget()
              ],
            ),
          )),
    );
  }

  Column buildTarget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          currencyFormat(widget.goal.target),
          style: cardBackTitleTextStyle,
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          'Target',
          style: cardBackSubtitleTextStyle,
        ),
      ],
    );
  }

  Column buildSaved() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          currencyFormat(widget.goal.progress),
          style: cardBackTitleTextStyle,
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          'Saved',
          style: cardBackSubtitleTextStyle,
        ),
      ],
    );
  }
}
