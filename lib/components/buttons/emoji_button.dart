import 'package:flutter/material.dart';
import 'package:wishes_app/utils/style.dart';

typedef OnTap = void Function(String val);

class EmojiButton extends StatefulWidget {
  const EmojiButton({Key key, this.emoji, this.onTap, this.isActive = false})
      : super(key: key);
  final String emoji;
  final OnTap onTap;
  final bool isActive;

  @override
  _EmojiButtonState createState() => _EmojiButtonState();
}

class _EmojiButtonState extends State<EmojiButton> {
  BoxDecoration inactiveStateDecoration = BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(
        width: 1,
        color: gray2,
      ),
      color: Colors.transparent,
      boxShadow: []);

  BoxDecoration activeStateDecoration = BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(
        width: 1,
        color: Colors.transparent,
      ),
      color: secondaryColor,
      boxShadow: [
        BoxShadow(
            offset: Offset(0, 10),
            blurRadius: 20,
            color: secondaryColor.withOpacity(0.3)),
      ]);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: GestureDetector(
        onTap: () {
          widget.onTap(widget.emoji);
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 250),
          curve: Curves.ease,
          width: 60,
          height: 60,
          decoration:
              widget.isActive ? activeStateDecoration : inactiveStateDecoration,
          child: Center(
            child: Text(
              widget.emoji,
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
