import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rect_getter/rect_getter.dart';
import 'package:wishes_app/components/buttons/emoji_button.dart';
import 'package:wishes_app/components/cards/default_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wishes_app/pages/browse_emojis.dart';
import 'package:wishes_app/providers/card_transition_provider.dart';
import 'package:wishes_app/utils/fade_route_builder.dart';
import 'package:wishes_app/utils/style.dart';
import 'package:emojis/emojis.dart';
import 'package:emojis/emoji.dart';
import 'package:wishes_app/components/buttons/flat_button.dart' as Button;

class ChooseStickerCard extends StatefulWidget {
  @override
  _ChooseStickerCardState createState() => _ChooseStickerCardState();
}

class _ChooseStickerCardState extends State<ChooseStickerCard> {
  String selectedEmoji = Emojis.soccerBall;

  final recentEmojis = [
    Emoji.byChar(Emojis.soccerBall).char,
    Emoji.byChar(Emojis.shoppingBags).char,
    Emoji.byChar(Emojis.stadium).char,
    Emoji.byChar(Emojis.catFace).char
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultCard(
      key: Provider.of<CardTransitionProvider>(context, listen: false)
          .rectGetterKey,
      color: Colors.white,
      width: double.infinity,
      height: 240.h,
      boxShadow: [],
      radius: 24,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Choose Sticker',
            style: cardTitleTextStyle,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (int i = 0; i < recentEmojis.length; i++)
                  EmojiButton(
                    emoji: recentEmojis[i],
                    isActive: recentEmojis[i] == selectedEmoji,
                    onTap: (val) {
                      setState(() {
                        selectedEmoji = val;
                      });
                    },
                  )
              ],
            ),
          ),
          Container(
            width: 120,
            child: Button.FlatButton(
              text: 'Browse',
              color: secondaryColor.withOpacity(0.1),
              textColor: secondaryColor,
              radius: 24,
              textSize: 12,
              onTap: () {
                pushBrowsePage();
              },
            ),
          )
        ],
      ),
    );
  }

  void setRect(Rect rect) {
    Provider.of<CardTransitionProvider>(context, listen: false).setRect(rect);
  }

  void pushBrowsePage() {
    var rectGetterKey =
        Provider.of<CardTransitionProvider>(context, listen: false)
            .rectGetterKey;
    setState(() => setRect(RectGetter.getRectFromKey(rectGetterKey)));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() => setRect(
          Provider.of<CardTransitionProvider>(context, listen: false)
              .rect
              .inflate(1.1 * MediaQuery.of(context).size.longestSide)));
      Future.delayed(
          Duration(
              milliseconds:
                  Provider.of<CardTransitionProvider>(context, listen: false)
                      .animationDuration),
          _goToNextPage);
    });
  }

  void _goToNextPage() {
    Navigator.of(context)
        .push(FadeRouteBuilder(page: BrowseEmojisPage()))
        .then((res) {
      setState(() {
        setRect(null);
        if (res != null) {
          recentEmojis.removeAt(0);
          recentEmojis.insert(0, res);
          selectedEmoji = res;
        }
      });
    });
  }
}
