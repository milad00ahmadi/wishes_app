import 'package:flutter/material.dart';
import 'package:wishes_app/utils/style.dart';

class HomeMenu extends StatefulWidget {
  @override
  _HomeMenuState createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello,',
                style: homeMenuSubtitleTextStyle,
              ),
              SizedBox(
                height: 3,
              ),
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Alex sandro',
                      style: homeMenuTitleStyle,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      height: 6,
                      width: 6,
                      decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(40)),
                    )
                  ],
                ),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.all(14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              gradient: homeProfileColor,
            ),
            child: Text(
              '🦄',
              style: profileTextStyle,
            ),
          )
        ],
      ),
    );
  }
}
