import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wishes_app/components/buttons/emoji_button.dart';
import 'package:wishes_app/components/menus/browse_emojis_menu.dart';
import 'package:wishes_app/utils/style.dart';
import 'package:emojis/emoji.dart';
import 'package:wishes_app/components/buttons/icon_button.dart' as App;

class BrowseEmojisPage extends StatefulWidget {
  @override
  _BrowseEmojisPageState createState() => _BrowseEmojisPageState();
}

class _BrowseEmojisPageState extends State<BrowseEmojisPage> {
  List<Emoji> activitiesGroup = Emoji.byGroup(EmojiGroup.activities).toList();

  List<Emoji> animalsNatureGroup =
      Emoji.byGroup(EmojiGroup.animalsNature).toList();

  List<Emoji> componentGroup = Emoji.byGroup(EmojiGroup.component).toList();

  List<Emoji> flagsGroup = Emoji.byGroup(EmojiGroup.flags).toList();

  List<Emoji> foodDrinkGroup = Emoji.byGroup(EmojiGroup.foodDrink).toList();

  List<Emoji> objectsGroup = Emoji.byGroup(EmojiGroup.objects).toList();

  List<Emoji> peopleBodyGroup = Emoji.byGroup(EmojiGroup.peopleBody).toList();

  List<Emoji> smileysEmotionGroup =
      Emoji.byGroup(EmojiGroup.smileysEmotion).toList();

  List<Emoji> travelPlacesGroup =
      Emoji.byGroup(EmojiGroup.travelPlaces).toList();

  List<Emoji> symbolsGroup = Emoji.byGroup(EmojiGroup.symbols).toList();

  String selectedEmoji;

  String filter;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        buildPage(),
        buildFoggyEffect(),
        AnimatedPositioned(
          duration: Duration(milliseconds: 300),
          left: 0,
          right: 0,
          curve: Curves.linear,
          bottom: selectedEmoji == null ? -80 : 35,
          child: Center(
            child: App.IconButton(
              onTap: () {
                setState(() {
                  Navigator.pop(context, selectedEmoji);
                });
              },
              icon: Align(
                child: SvgPicture.asset(
                  'assets/icons/check-icon.svg',
                  height: 16,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Positioned buildFoggyEffect() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: IgnorePointer(
        child: Container(
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(gradient: emojiesFoggyBackground),
        ),
      ),
    );
  }

  Positioned buildPage() {
    return Positioned(
      top: 0,
      bottom: 0,
      left: 0,
      right: 0,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: ListView(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.only(top: 0, left: 38, right: 38),
            children: [
              BrowseEmojisMenu(),
              SizedBox(
                height: 20,
              ),
              buildSearchTextField(),
              SizedBox(
                height: 24,
              ),
              buildEmojisGridView(smileysEmotionGroup, 'Smileys Emotion'),
              buildEmojisGridView(travelPlacesGroup, 'Travel Places'),
              buildEmojisGridView(activitiesGroup, 'Activities'),
              buildEmojisGridView(animalsNatureGroup, 'Animals & Nature'),
              buildEmojisGridView(foodDrinkGroup, 'Food & Drink'),
              buildEmojisGridView(peopleBodyGroup, 'People Body'),
              buildEmojisGridView(symbolsGroup, 'Symbols'),
            ],
          ),
        ),
      ),
    );
  }

  Padding buildSearchTextField() {
    return Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: TextField(
        onChanged: (val) {
          setState(() {
            filter = val;
          });
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 5),
          enabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:
                  BorderSide(width: 1, color: gray2, style: BorderStyle.solid)),
          hintText: 'Search',
          hintStyle: TextStyle(color: gray2),
          prefixIcon: Padding(
            padding: EdgeInsets.all(10),
            child: SvgPicture.asset(
              'assets/icons/search-icon.svg',
              color: gray2,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildEmojisGridView(List<Emoji> emojis, String groupName) {
    List<Emoji> filteredEmojis = [...emojis];
    if (filter != null) {
      filteredEmojis = filteredEmojis
          .where((element) => element.name.contains(filter))
          .toList();
    }
    if (filteredEmojis.length == 0){
      return Container();
    }
    return Column(
      children: [
        Text(
          groupName,
          style: TextStyle(
              color: gray2, fontSize: 14, fontWeight: FontWeight.w300),
        ),
        SizedBox(
          height: 16,
        ),
        GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: filteredEmojis.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
            ),
            itemBuilder: (ctx, index) {
              return EmojiButton(
                emoji: filteredEmojis[index].char,
                isActive: selectedEmoji == filteredEmojis[index].char,
                onTap: (val) {
                  setState(() {
                    selectedEmoji = val;
                  });
                },
              );
            }),
        SizedBox(
          height: 24,
        ),
      ],
    );
  }
}
