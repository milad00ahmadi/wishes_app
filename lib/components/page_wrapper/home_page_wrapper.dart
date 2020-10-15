import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wishes_app/pages/activities_page.dart';
import 'package:wishes_app/pages/dashboard.dart';
import 'package:wishes_app/pages/schedule_page.dart';


typedef OnPageChanged = void Function(int index);

class HomePageWrapper extends StatelessWidget {
  HomePageWrapper({
    Key key,
    this.controller,
    this.onPageChanged,
  }) : super(key: key);

  final PageController controller;
  final OnPageChanged onPageChanged;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(40), bottomLeft: Radius.circular(40)),
      child: Container(
        height: pageWrapperHeight(context),
        color: Colors.white,
        child: SafeArea(
          child: PageView(
            physics: BouncingScrollPhysics(),
            controller: this.controller,
            onPageChanged: (index) {
              this.onPageChanged(index);
            },
            children: [
              DashboardPage(),
              ActivitiesPage(),
              SchedulePage(),
            ],
          ),
        ),
      ),

    );
  }

  double pageWrapperHeight(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return mediaQuery.size.height -
        130.h;
  }
}
