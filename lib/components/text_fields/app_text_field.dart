import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  const AppTextField(
      {Key key, this.controller, this.placeholder, this.color, this.textColor})
      : super(key: key);

  final TextEditingController controller;
  final String placeholder;
  final Color color;
  final Color textColor;

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  FocusNode textFieldFocusNode;

  activeStateStyle(Color color) =>
      BoxDecoration(
          color: widget.color.withOpacity(0.4),
          borderRadius: BorderRadius.circular(24));

  idleStateStyle(Color color) =>
      BoxDecoration(
          color: widget.color.withOpacity(0.2),
          borderRadius: BorderRadius.circular(24));

  @override
  void initState() {
    textFieldFocusNode = FocusNode();
    textFieldFocusNode.addListener(() {
      setState(() {

      });
    });
    super.initState();
  }

  @override
  void dispose() {
    textFieldFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          textFieldFocusNode.requestFocus();
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 250),
          curve: Curves.ease,
          decoration: textFieldFocusNode.hasFocus ?? false
              ? activeStateStyle(widget.color)
              : idleStateStyle(widget.color),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: TextField(
                controller: widget.controller,
                focusNode: textFieldFocusNode,
                decoration: InputDecoration(
                    fillColor: Colors.transparent,
                    filled: true,
                    border: InputBorder.none,
                    hintText: widget.placeholder,
                    hintStyle: TextStyle(
                        color: widget.color,
                        fontSize: 14,
                        fontWeight: FontWeight.w400))),
          ),
        ));
  }
}
