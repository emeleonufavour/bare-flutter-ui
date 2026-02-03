import 'package:flutter/material.dart';

class Box extends RenderBox {
  double _width;
  double _height;
  Color? _color;

  Box({required double width, required double height, Color? color})
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
    super.performLayout();

    size = constraints.constrain(Size(_width, _height));
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    super.paint(context, offset);

    final paint = Paint();

    if (_color != null) {
      paint.color = _color!;
    }
  }
}
