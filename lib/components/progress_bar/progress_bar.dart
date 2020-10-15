import 'package:flutter/material.dart';
import 'package:wishes_app/utils/style.dart';

class ProgressBar extends StatefulWidget {
  const ProgressBar({Key key, this.value}) : super(key: key);

  final double value;

  @override
  _ProgressBarState createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar>
    with SingleTickerProviderStateMixin {
  AnimationController progressBarAnimationController;
  Animation<double> progressBarAnimation;
  GlobalKey progressContainerKey;
  bool firstBuild = true;
  int currentPercent = 0;

  @override
  void initState() {
    progressContainerKey = GlobalKey();
    progressBarAnimationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
    super.initState();
  }

  void _afterLayout(_) {
    Size progressContainer = progressContainerKey.currentContext.size;
    progressBarAnimation = Tween<double>(
            begin: 0, end: progressContainer.width * (widget.value / 100))
        .animate(CurvedAnimation(
            parent: progressBarAnimationController, curve: Curves.ease))
          ..addListener(() {
            setState(() {
              currentPercent =
                  ((progressBarAnimation.value / progressContainer.width) * 100)
                      .toInt();
            });
          });
    progressBarAnimationController.forward();
  }

  @override
  void dispose() {
    progressBarAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          '$currentPercent%',
          style: TextStyle(
              fontSize: 12, color: secondaryColor, fontWeight: FontWeight.bold),
        ),
        Container(
          width: double.infinity,
          key: progressContainerKey,
          padding: EdgeInsets.all(4),
          height: 16,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: primaryColorDarker,
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width:
                  progressBarAnimation != null ? progressBarAnimation.value : 0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: secondaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
