import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wishes_app/components/cards/default_card.dart';
import 'package:wishes_app/components/page_wrapper/add_goal_page_wrapper.dart';
import 'package:wishes_app/providers/card_transition_provider.dart';
import 'package:wishes_app/utils/style.dart';
import 'package:wishes_app/components/buttons/flat_button.dart' as Button;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AddGoalPageContent();
  }
}

class AddGoalPageContent extends StatefulWidget {
  @override
  _AddGoalPageContentState createState() => _AddGoalPageContentState();
}

class _AddGoalPageContentState extends State<AddGoalPageContent> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CardTransitionProvider>(
      create: (_) => CardTransitionProvider(),
      child: Consumer<CardTransitionProvider>(
          builder: (ctx, CardTransitionProvider provider, _) => Stack(
                children: [
                  buildPage(),
                  pageTransitionEffect(provider),
                ],
              )),
    );
  }

  Widget buildPage() {
    return Container(
      child: Scaffold(
        backgroundColor: primaryColor,
        body: Stack(
          children: [
            Positioned(top: 0, left: 0, right: 0, child: AddGoalPageWrapper()),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: 90.h,
              child: Button.FlatButton(
                onTap: () => {},
                text: 'Add To Goals',
                color: Colors.transparent,
                textColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget pageTransitionEffect(CardTransitionProvider provider) {
    var rect = provider.rect;
    var animationDuration = provider.animationDuration;
    if (rect == null) {
      return Container();
    }
    return AnimatedPositioned(
      duration: Duration(milliseconds: animationDuration),
      left: rect.left,
      right: MediaQuery.of(context).size.width - rect.right,
      top: rect.top,
      bottom: MediaQuery.of(context).size.height - rect.bottom,
      child: DefaultCard(
          color: Colors.white,
          width: double.infinity,
          height: 250.h,
          boxShadow: [],
          radius: 24,
          child: Container()),
    );
  }
}
