import 'package:ambiez/design/foundations/colors.dart';
import 'package:flutter/material.dart';

class Line extends StatefulWidget {
  const Line({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LineState();
}

class _LineState extends State<Line> with SingleTickerProviderStateMixin {
  double _progress = 0.0;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    var controller = AnimationController(
        duration: Duration(milliseconds: 1000), vsync: this);

    animation = Tween(begin: 1.0, end: 0.0).animate(controller)
      ..addListener(() {
        setState(() {
          _progress = animation.value;
        });
      });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: LinePainter(_progress));
  }
}

class LinePainter extends CustomPainter {
  late Paint _paint;
  late double _progress;

  LinePainter(this._progress) {
    _paint = Paint()
      ..color = AmbiezColorsFoundation.primaryColor
      ..strokeWidth = 1.2;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(Offset(0.0, 0.0), Offset(100.0, 0.0), _paint);
  }

  @override
  bool shouldRepaint(LinePainter oldDelegate) {
    return oldDelegate._progress != _progress;
  }
}
