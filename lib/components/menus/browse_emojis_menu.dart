import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wishes_app/utils/style.dart';

class BrowseEmojisMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96.h,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(200),
              child: Material(
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 65,
                    width: 65,
                    decoration: BoxDecoration(
                      color: Colors.white,
                        border: Border.all(color: gray1, width: 1),
                        shape: BoxShape.circle),
                    child: Align(
                      child: SvgPicture.asset(
                        'assets/icons/back-icon.svg',
                        height: 14.h,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              'Stickers',
              style: browseEmojisTitleTextStyle,
            ),
          )
        ],
      ),
    );
  }
}
