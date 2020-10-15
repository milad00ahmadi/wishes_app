import 'package:emojis/emoji.dart';
import 'package:emojis/emojis.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wishes_app/utils/style.dart';
import 'package:wishes_app/utils/util.dart';

typedef OnChanged = void Function(double value);

class AppSlider extends StatefulWidget {
  final double min, max;

  const AppSlider({Key key, this.min = 10, this.max = 4000}) : super(key: key);

  @override
  _AppSliderState createState() => _AppSliderState();
}

class _AppSliderState extends State<AppSlider> {
  double currentValue = 40;
  @override
  void initState() {
    currentValue = widget.max * 0.45;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            currencyFormat(currentValue.toDouble()),
            style: sliderValueTextStyle,
          ),
          SizedBox(
            height: 15,
          ),
          buildSlider(),
        ],
      ),
    );
  }

  Widget buildSlider() {
    return Container(
      height: 60.h,
      width: double.infinity,
      child: SliderTheme(
        data: SliderTheme.of(context).copyWith(
          activeTrackColor: Colors.white,
          inactiveTrackColor: Colors.white.withOpacity(0.1),
          trackHeight: 6,
          thumbShape: SliderCircle(),
        ),
        child: Slider(
            min: widget.min,
            max: widget.max,
            value: currentValue,
            onChanged: (value) {
              setState(() {
                currentValue = value;
              });
            }),
      ),
    );
  }
}

class SliderCircle extends SliderComponentShape {
  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(10);
  }

  @override
  void paint(PaintingContext context, Offset center,
      {Animation<double> activationAnimation,
      Animation<double> enableAnimation,
      bool isDiscrete,
      TextPainter labelPainter,
      RenderBox parentBox,
      SliderThemeData sliderTheme,
      TextDirection textDirection,
      double value,
      double textScaleFactor,
      Size sizeWithOverflow}) {
    final Canvas canvas = context.canvas;

    final rect = Rect.fromCircle(
      radius: 28,
      center: center,
    );
    Path path = Path();
    path.addOval(rect);

    final paint = Paint()
      ..color = Colors.white
      ..shader = homeProfileColor.createShader(rect)
      ..style = PaintingStyle.fill;
    final strokePainter = Paint()
      ..color = Colors.white
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    TextSpan span = new TextSpan(
        style: new TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: sliderTheme.thumbColor,
            height: 1),
        text: Emoji.byChar(Emojis.moneyBag).char);

    TextPainter tp = new TextPainter(
        text: span,
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr);
    tp.layout();
    Offset textCenter =
        Offset(center.dx - (tp.width / 2), center.dy - (tp.height / 2));

    canvas.drawPath(path, paint);
    canvas.drawPath(path, strokePainter);
    tp.paint(canvas, textCenter);
  }
}
