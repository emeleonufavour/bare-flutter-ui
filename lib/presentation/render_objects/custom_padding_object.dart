import 'package:flutter/rendering.dart';

class CustomPaddingObject extends RenderShiftedBox {
  EdgeInsets _padding;

  CustomPaddingObject({required EdgeInsets edgeInsets})
    : _padding = edgeInsets,
      super(null);

  EdgeInsets get padding => _padding;

  set padding(EdgeInsets val) {
    if (val != _padding) {
      _padding = val;
      markNeedsLayout();
    }
  }

  @override
  double computeMaxIntrinsicHeight(double width) {
    if (child == null) {
      return _padding.vertical;
    }

    return child!.getMaxIntrinsicHeight(width) + _padding.vertical;
  }

  @override
  double computeMinIntrinsicHeight(double width) {
    if (child == null) {
      return _padding.vertical;
    }

    return child!.getMinIntrinsicHeight(width) + _padding.vertical;
  }

  @override
  double computeMaxIntrinsicWidth(double height) {
    if (child == null) {
      return _padding.horizontal;
    }

    return child!.getMaxIntrinsicWidth(height) + _padding.horizontal;
  }

  @override
  double computeMinIntrinsicWidth(double height) {
    if (child == null) {
      return _padding.horizontal;
    }

    return child!.getMinIntrinsicWidth(height) + _padding.horizontal;
  }

  @override
  void performLayout() {
    if (child == null) {
      size = constraints.constrain(
        Size(_padding.horizontal, _padding.vertical),
      );
      return;
    }

    final parentData = child!.parentData as BoxParentData;

    final childConstraints = constraints.deflate(_padding);

    child!.layout(childConstraints, parentUsesSize: true);

    parentData.offset = Offset(_padding.left, _padding.top);

    size = constraints.constrain(
      Size(
        child!.size.width + _padding.horizontal,
        child!.size.height + _padding.vertical,
      ),
    );
  }
}
