import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:rect_getter/rect_getter.dart';
import 'package:wishes_app/components/page_wrapper/home_page_wrapper.dart';
import 'package:wishes_app/utils/fade_route_builder.dart';
import 'package:wishes_app/utils/style.dart';
import 'package:wishes_app/components/bottom_navigation_bar/bottom_navigation_bar.dart'
    as WishesBottomNavigationBar;
import 'package:wishes_app/components/bottom_navigation_bar/bottom_navigation_bar_item.dart'
    as Item;

import 'add_goal.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController;
  int currentPage;
  final int animationDuration = 300;
  GlobalKey rectGetterKey = RectGetter.createGlobalKey();
  Rect rect;

  @override
  void initState() {
    this.pageController = PageController();
    currentPage = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(411.4, 797.7), allowFontScaling: false);
    return Stack(
      children: [
        buildHomePage(),
        rippleEffect2(),
        rippleEffect(),
      ],
    );
  }

  Scaffold buildHomePage() {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: HomePageWrapper(
              controller: pageController,
              onPageChanged: (index) {
                changeCurrentPage(index);
              },
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: WishesBottomNavigationBar.BottomNavigationBar(
              rectGetterKey: rectGetterKey,
              onActionButtonTap: () {
                pushAddGoalsPage();
              },
              onTap: (index) {
                pageController.animateToPage(index,
                    duration: Duration(milliseconds: 250), curve: Curves.ease);
                currentPage = index;
              },
              currentIndex: currentPage,
              bottomNavigationBarItems: [
                Item.BottomNavigationBarItem(
                    label: 'Home', iconPath: 'assets/icons/home-icon.svg'),
                Item.BottomNavigationBarItem(
                    label: 'Activities',
                    iconPath: 'assets/icons/activity-icon.svg'),
                Item.BottomNavigationBarItem(
                    label: 'Schedule',
                    iconPath: 'assets/icons/calendar-icon.svg')
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget rippleEffect() {
    if (rect == null) {
      return Container();
    }
    return AnimatedPositioned(
      duration: Duration(milliseconds: animationDuration),
      left: rect.left,
      right: MediaQuery.of(context).size.width - rect.right,
      top: rect.top,
      bottom: MediaQuery.of(context).size.height - rect.bottom,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: secondaryColor,
        ),
      ),
    );
  }

  Widget rippleEffect2() {
    if (rect == null) {
      return Container();
    }
    return AnimatedPositioned(
      duration: Duration(milliseconds: (animationDuration * 0.6).toInt()),
      left: rect.left,
      right: MediaQuery.of(context).size.width - rect.right,
      top: rect.top,
      bottom: MediaQuery.of(context).size.height - rect.bottom,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: secondaryColor.withOpacity(0.2),
        ),
      ),
    );
  }

  void changeCurrentPage(int index) {
    setState(() {
      this.currentPage = index;
    });
  }

  void pushAddGoalsPage() {
    setState(() => rect = RectGetter.getRectFromKey(rectGetterKey));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() =>
          rect = rect.inflate(1.1 * MediaQuery.of(context).size.longestSide));
      Future.delayed(Duration(milliseconds: animationDuration), _goToNextPage);
    });
  }

  void _goToNextPage() {
    Navigator.of(context)
        .push(FadeRouteBuilder(page: AddGoalPageContent()))
        .then((_) => setState(() => rect = null));
  }
}
