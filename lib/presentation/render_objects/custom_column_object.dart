import 'dart:math';

import 'package:flutter/rendering.dart';

class CustomColumnObject extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, FlexParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox, FlexParentData>,
        DebugOverflowIndicatorMixin {
  final CrossAxisAlignment _crossAxisAlignment;
  CustomColumnObject({
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.start,
  }) : _crossAxisAlignment = crossAxisAlignment;

  CrossAxisAlignment get crossAxisAlignment => _crossAxisAlignment;
  set crossAxisAlignment(CrossAxisAlignment val) {
    if (val != _crossAxisAlignment) {
      markNeedsLayout();
    }
  }

  @override
  void setupParentData(covariant RenderObject child) {
    if (child.parentData is! FlexParentData) {
      child.parentData = FlexParentData();
    }
  }

  double getXAxis(CrossAxisAlignment val, double maxWidth, double childWidth) {
    double res = 0;
    switch (val) {
      case CrossAxisAlignment.center:
        res = (maxWidth - childWidth) / 2;
        break;

      case CrossAxisAlignment.end:
        res = maxWidth - childWidth;
        break;

      default:
        return 0;
    }

    return res;
  }

  @override
  void performLayout() {
    double dy = 0.0;

    double maxWidth = 0.0;

    RenderBox? child = firstChild;

    // Let's get the maximum width of all the children
    while (child != null) {
      final parentData = child.parentData as FlexParentData;

      child.layout(
        BoxConstraints(
          maxWidth: constraints.maxWidth,
          minWidth: 0,
          minHeight: 0,
          maxHeight: constraints.maxHeight,
        ),
        parentUsesSize: true,
      );

      maxWidth = max(maxWidth, child.size.width);
      child = parentData.nextSibling;
    }

    child = firstChild;

    while (child != null) {
      final FlexParentData data = child.parentData as FlexParentData;

      double xAxis = getXAxis(_crossAxisAlignment, maxWidth, child.size.width);

      data.offset = Offset(xAxis, dy);

      dy += child.size.height;

      child = data.nextSibling;
    }

    size = Size(maxWidth, dy.clamp(0, constraints.maxHeight));
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    defaultPaint(context, offset);
  }
}
