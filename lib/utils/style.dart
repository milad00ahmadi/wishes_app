import 'package:flutter/material.dart';

const primaryColor = Color.fromRGBO(62, 32, 109, 1);
const secondaryColor = Color.fromRGBO(251, 116, 187, 1);
const primaryColorDarker = Color.fromRGBO(52, 17, 99, 1);
const gray1 = Color.fromRGBO(244, 244, 244, 1);
const gray2 = Color.fromRGBO(232, 231, 234, 1);

TextStyle homeMenuSubtitleTextStyle =
    TextStyle(color: Color.fromRGBO(178, 173, 185, 1), fontSize: 14);

TextStyle homeMenuTitleStyle =
    TextStyle(color: Color.fromRGBO(25, 13, 45, 1), fontSize: 20);

TextStyle homeTitleStyle = TextStyle(
    color: Color.fromRGBO(25, 13, 45, 1),
    fontSize: 22,
    fontWeight: FontWeight.bold,
    height: 2);

TextStyle goalCardTitleStyle = TextStyle(
    color: primaryColor, fontSize: 18, fontWeight: FontWeight.bold, height: 2);

TextStyle goalCardSavedStyle = TextStyle(
    color: Color.fromRGBO(195, 193, 200, 1),
    fontSize: 14,
    fontWeight: FontWeight.w300,
    height: 1);
TextStyle goalCardAmountStyle = TextStyle(
    color: Color.fromRGBO(106, 57, 183, 1),
    fontSize: 14,
    fontWeight: FontWeight.bold,
    height: 1);

TextStyle flatButtonTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 16,
  fontWeight: FontWeight.bold,
);

TextStyle addGoalTitleTextStyle =
    TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold);
TextStyle cardTitleTextStyle =
    TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 14);
TextStyle profileTextStyle = TextStyle(fontSize: 12);

TextStyle sliderValueTextStyle =
    TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 26);
TextStyle browseEmojisTitleTextStyle =
    TextStyle(fontWeight: FontWeight.bold, color: Colors.black87, fontSize: 18);
TextStyle cardBackTitleTextStyle =
    TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold);
TextStyle cardBackSubtitleTextStyle =
    TextStyle(fontSize: 14, color: Colors.white70, fontWeight: FontWeight.w300);

LinearGradient homeProfileColor = LinearGradient(colors: [
  Color.fromRGBO(235, 246, 255, 1),
  Color.fromRGBO(255, 244, 231, 1),
  Color.fromRGBO(228, 255, 253, 1),
  Color.fromRGBO(255, 245, 253, 1),
], begin: Alignment.topLeft, end: Alignment.bottomRight);

LinearGradient emojiesFoggyBackground = LinearGradient(
    colors: [
      Color.fromRGBO(255, 255, 255, 0.7),
      Color.fromRGBO(255, 255, 255, 0.1),
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    stops: [0.3, 1]);
