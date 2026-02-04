import 'package:flutter/rendering.dart';

class CustomSizedBoxObject extends RenderProxyBox {
  double _height;
  double _width;

  CustomSizedBoxObject({required double height, required double width})
    : _width = width,
      _height = height;

  double get height => _height;
  set height(double val) {
    if (val != _height) {
      _height = val;
      markNeedsLayout();
    }
  }

  double get width => _width;
  set width(double val) {
    if (val != _width) {
      _width = val;
      markNeedsLayout();
    }
  }

  @override
  void performLayout() {
    if (child == null) {
      size = constraints.constrain(Size(_width, _height));
      return;
    }
    BoxConstraints tightConstraints = BoxConstraints.tightFor(
      width: _width,
      height: _height,
    );

    BoxConstraints childConstraints = constraints.enforce(tightConstraints);

    child!.layout(childConstraints, parentUsesSize: true);

    size = constraints.constrain(child!.size);
  }
}
