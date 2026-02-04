import 'package:flutter/material.dart';

class CustomTextObject extends RenderBox {
  String _text;
  TextStyle? _style;
  TextPainter? _painter;

  CustomTextObject({required String text, TextStyle? style})
    : _style = style,
      _text = text {
    updatePainter();
  }

  @override
  bool get sizedByParent => false;

  String get text => _text;
  TextStyle? get style => _style;

  set text(String val) {
    if (_text != val) {
      _text = val;
      updatePainter();
      markNeedsLayout();
    }
  }

  set style(TextStyle? val) {
    if (val != _style) {
      _style = val;
      updatePainter();
      markNeedsLayout();
    }
  }

  void updatePainter() {
    _painter = TextPainter(
      text: TextSpan(text: _text, style: _style),
      textDirection: TextDirection.ltr,
    );
  }

  @override
  void performLayout() {
    if (_painter == null) {
      size = Size.zero;
      return;
    }
    _painter?.layout(minWidth: 0, maxWidth: constraints.maxWidth);

    size = constraints.constrain(Size(_painter!.width, _painter!.height));
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    _painter?.paint(context.canvas, offset);
  }

  @override
  double computeMaxIntrinsicHeight(double width) {
    _painter?.layout(maxWidth: width);
    return _painter!.height;
  }

  @override
  double computeMinIntrinsicHeight(double width) {
    _painter?.layout(maxWidth: width);
    return _painter!.height;
  }

  @override
  double computeMinIntrinsicWidth(double height) {
    _painter?.layout();
    return _painter!.width;
  }

  @override
  double computeMaxIntrinsicWidth(double height) {
    _painter?.layout();
    return _painter!.width;
  }
}
