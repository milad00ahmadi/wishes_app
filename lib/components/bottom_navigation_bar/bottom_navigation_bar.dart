import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:rect_getter/rect_getter.dart';
import 'package:wishes_app/components/bottom_navigation_bar/bottom_navigation_bar_provider.dart';
import 'package:wishes_app/components/bottom_navigation_bar/bottom_navigation_bar_tile.dart';
import 'package:wishes_app/components/bottom_navigation_bar/bottom_navigation_bar_item.dart'
    as Item;
import 'package:wishes_app/utils/style.dart';

typedef OnTap = void Function(int double);
typedef OnActionButtonTap = void Function();

class BottomNavigationBar extends StatefulWidget {
  const BottomNavigationBar(
      {Key key, this.bottomNavigationBarItems, this.currentIndex, this.onTap, this.onActionButtonTap, this.rectGetterKey})
      : super(key: key);

  final List<Item.BottomNavigationBarItem> bottomNavigationBarItems;
  final int currentIndex;
  final OnTap onTap;
  final OnActionButtonTap onActionButtonTap;
  final GlobalKey rectGetterKey;

  @override
  _BottomNavigationBarState createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<BottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BottomNavigationBarProvider(),
      child: Container(
        width: double.infinity,
        height:  130.h,
        padding: EdgeInsets.symmetric(horizontal: 32),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildNavigationBarItems(context),
            buildActionButton(context)
          ],
        ),
      ),
    );
  }

  Widget buildActionButton(BuildContext context) {
    return RectGetter(
      key: widget.rectGetterKey,
      child: GestureDetector(
          onTap: () {
            widget.onActionButtonTap();
          },
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: secondaryColor,
            ),
            padding: EdgeInsets.all(18),
            child: Container(
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(6),
                child: SvgPicture.asset(
                  'assets/icons/plus-icon.svg',
                  height: 10.h,
                  color: secondaryColor,
                ),
              ),
            ),
          )),
    );
  }

  Widget buildNavigationBarItems(BuildContext context) {
    List<BottomNavigationBarTile> bottomNavigationBarTiles = [];
    for (var i = 0; i < this.widget.bottomNavigationBarItems.length; i++) {
      bottomNavigationBarTiles.add(BottomNavigationBarTile(
        label: this.widget.bottomNavigationBarItems[i].label,
        iconPath: this.widget.bottomNavigationBarItems[i].iconPath,
        index: i,
        isActive: widget.currentIndex == i,
        onTap: (index) {
          this.widget.onTap(index);
        },
      ));
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: bottomNavigationBarTiles,
    );
  }
}
