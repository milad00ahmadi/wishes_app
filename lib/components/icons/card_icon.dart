import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wishes_app/utils/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardIcon extends StatelessWidget {
  final Widget child;
  final Gradient gradient;
  final IconData icon;

  CardIcon(
      {Key key,
      this.child,
      this.icon,
      this.gradient = const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromRGBO(237, 239, 251, 1),
            Color.fromRGBO(172, 183, 236, 1),
          ])})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.w,
      height: 40.w,
      decoration: BoxDecoration(
          gradient: this.gradient, borderRadius: BorderRadius.circular(400)),
      padding: EdgeInsets.all(10),
      child: SvgPicture.asset(
        'assets/icons/star-icon.svg',
        color: primaryColor,
      ),
    );
  }
}
