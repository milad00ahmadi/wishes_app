import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:wishes_app/components/bottom_navigation_bar/bottom_navigation_bar_provider.dart';
import 'package:wishes_app/utils/style.dart';

typedef OnTap = void Function(int index);

class BottomNavigationBarTile extends StatefulWidget {
  BottomNavigationBarTile(
      {Key key,
      this.label,
      this.iconPath,
      this.isActive,
      this.onTap,
      this.index})
      : super(key: key);

  final String label;
  final String iconPath;
  final bool isActive;
  final OnTap onTap;
  final int index;

  @override
  _BottomNavigationBarTileState createState() =>
      _BottomNavigationBarTileState();
}

class _BottomNavigationBarTileState extends State<BottomNavigationBarTile>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> scaleAnimation;
  Animation<Offset> offsetAnimation;
  Animation<Offset> dotOffsetAnimation;

  @override
  void initState() {
    initAnimations();
    super.initState();
  }

  void initAnimations() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    scaleAnimation =
        CurvedAnimation(parent: animationController, curve: Curves.easeIn);
    offsetAnimation = Tween<Offset>(
      begin: Offset(0, 1),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.ease,
    ));
    dotOffsetAnimation = Tween<Offset>(
      begin: Offset(0, -1),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.ease,
    ));
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(BottomNavigationBarTile oldWidget) {
    if (oldWidget.isActive != widget.isActive) {
      animationController.reset();
      animationController.forward();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavigationBarProvider>(
        builder: (context, provider, _) {
      animationController.forward();
      Widget tileIcon = SvgPicture.asset(
        widget.iconPath,
        height: 22,
        color: Colors.white70,
      );
      List<Widget> activeIcon = [
        SlideTransition(
          position: offsetAnimation,
          child: Text(
            widget.label,
            style: TextStyle(fontSize: 12, color: secondaryColor),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        SlideTransition(
          position: dotOffsetAnimation,
          child: Container(
            width: 4,
            height: 4,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: secondaryColor,
            ),
          ),
        ),
      ];
      return GestureDetector(
        onTap: () {
          Provider.of<BottomNavigationBarProvider>(context, listen: false)
              .setIndex(widget.index);
          widget.onTap(widget.index);
        },
        child: Container(
          height: 80,
          width: 80,
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.isActive) ...activeIcon else tileIcon,
            ],
          ),
        ),
      );
    });
  }
}
