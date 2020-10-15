import 'package:flutter/material.dart';
import 'package:wishes_app/utils/style.dart';

class DefaultCard extends StatefulWidget {
  final Widget child;
  final Color color;
  final double width, height;
  final List<BoxShadow> boxShadow;
  final double radius;

  DefaultCard(
      {Key key,
      this.child,
      this.color = primaryColor,
      this.width = double.infinity,
      this.height = double.infinity, this.boxShadow, this.radius})
      : super(key: key);

  @override
  _DefaultCardState createState() => _DefaultCardState();
}

class _DefaultCardState extends State<DefaultCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(widget.radius ?? 32),
          boxShadow:widget.boxShadow ?? [
            BoxShadow(
                offset: Offset(0, 25),
                blurRadius: 60,
                color: primaryColor.withOpacity(0.25))
          ]),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: widget.child,
      ),
    );
  }
}
