import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wishes_app/components/cards/choose_sticker_card.dart';
import 'package:wishes_app/components/text_fields/app_text_field.dart';
import 'package:wishes_app/utils/style.dart';
import 'package:wishes_app/components/buttons/close_button.dart' as App;
import 'package:wishes_app/components/slider/slider.dart' as App;

typedef OnPageChanged = void Function(int index);

class AddGoalPageWrapper extends StatefulWidget {
  final GlobalKey rectGetterKey;
  final rect;

  const AddGoalPageWrapper({Key key, this.rectGetterKey, this.rect}) : super(key: key);

  @override
  _AddGoalPageWrapperState createState() => _AddGoalPageWrapperState();
}

class _AddGoalPageWrapperState extends State<AddGoalPageWrapper>
    with SingleTickerProviderStateMixin {
  AnimationController closeButtonAnimationController;
  Animation<Offset> closeButtonAnimation;
  TextEditingController textEditingController;

  @override
  void initState() {
    initAnimations();
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    closeButtonAnimationController.dispose();
    textEditingController.dispose();
    super.dispose();
  }

  void initAnimations() {
    closeButtonAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    closeButtonAnimation =
        Tween<Offset>(begin: Offset(0, -100), end: Offset(0, 0)).animate(
            CurvedAnimation(
                curve: Curves.ease, parent: closeButtonAnimationController));
    Future.delayed(Duration(milliseconds: 500), () {
      closeButtonAnimationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(40), bottomLeft: Radius.circular(40)),
      child: Container(
        height: pageWrapperHeight(context),
        color: secondaryColor,
        child: SafeArea(
          child: ListView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.only(top: 30, left: 38, right: 38),
            children: [
              buildCloseButton(),
              buildTitle(),
              buildTextField(),
              buildChooseStickerCard(),
              buildSlider(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSlider() {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 30), child: App.AppSlider());
  }

  Widget buildTitle() {
    return Center(
        child: Padding(
            padding: EdgeInsets.only(top: 30),
            child: Text(
              'Add New Goal',
              style: addGoalTitleTextStyle,
            )));
  }

  Padding buildTextField() {
    return Padding(
      padding: EdgeInsets.only(top: 30),
      child: AppTextField(
        placeholder: 'Goal Title',
        controller: textEditingController,
        color: Colors.white,
        textColor: Colors.black87,
      ),
    );
  }

  AnimatedBuilder buildCloseButton() {
    return AnimatedBuilder(
      animation: closeButtonAnimation,
      builder: (ctx, child) => Transform.translate(
        offset: closeButtonAnimation.value,
        child: child,
      ),
      child: App.CloseButton(),
    );
  }

  Widget buildChooseStickerCard() {
    return Padding(
        padding: EdgeInsets.only(top: 20), child: ChooseStickerCard());
  }

  double pageWrapperHeight(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return mediaQuery.size.height - 90.h;
  }
}
