import 'package:flutter/material.dart';
import 'package:wishes_app/utils/style.dart';

typedef OnTap = void Function();

class FlatButton extends StatelessWidget {
  const FlatButton(
      {Key key,
      this.textColor = Colors.white,
      this.color = Colors.white,
      this.text,
      this.radius = 0,
      this.textSize = 16,
      this.onTap})
      : super(key: key);

  final Color color;
  final Color textColor;
  final String text;
  final OnTap onTap;
  final double radius;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Material(
        color: this.color,
        child: InkWell(
          onTap: () => this.onTap(),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Center(
              child: Text(
                this.text,
                style: flatButtonTextStyle.copyWith(
                    color: this.textColor, fontSize: textSize),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
