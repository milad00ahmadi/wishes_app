import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef OnTap = void Function();
class CloseButton extends StatelessWidget {

  const CloseButton({Key key, this.onTap}) : super(key: key);

  final OnTap onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
              color: Colors.white, width: 25, style: BorderStyle.solid),
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: SvgPicture.asset(
            'assets/icons/close-icon.svg',
            height: 10.h,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
