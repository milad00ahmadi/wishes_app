import 'package:flutter/material.dart';
import 'package:wishes_app/utils/style.dart';

typedef OnTap = void Function();

class IconButton extends StatelessWidget {
  const IconButton({Key key, this.onTap, this.icon}) : super(key: key);
  final OnTap onTap;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(300),
      child: Material(
        borderRadius: BorderRadius.circular(300),
        color: primaryColor,
        child: InkWell(
          onTap: () =>{ this.onTap()},
          splashColor: Colors.white38,
          child: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
                color: primaryColor,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                )),
            child: icon,
          ),
        ),
      ),
    );
  }
}
