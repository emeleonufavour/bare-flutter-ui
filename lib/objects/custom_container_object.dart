import 'package:flutter/material.dart';

class CustomBoxObject extends RenderBox {
  double _width;
  double _height;
  Color? _color;

  CustomBoxObject({required double width, required double height, Color? color})
    : _color = color,
      _height = height,
      _width = width;

  double get width => _width;
  double get height => _height;
  Color? get color => _color;

  set width(double val) {
    _width = val;
    markNeedsLayout();
  }

  set height(double val) {
    _height = val;
    markNeedsLayout();
  }

  set color(Color val) {
    _color = val;
    markNeedsPaint();
  }

  @override
  void performLayout() {
    size = constraints.constrain(Size(_width, _height));
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    if (color == null) return;
    final paint = Paint();

    paint.color = _color!;

    context.canvas.drawRect(offset & size, paint);
  }
}
