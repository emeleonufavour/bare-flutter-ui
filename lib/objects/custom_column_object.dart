import 'dart:math';

import 'package:flutter/rendering.dart';

class CustomColumnObject extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, FlexParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox, FlexParentData>,
        DebugOverflowIndicatorMixin {
  @override
  void setupParentData(covariant RenderObject child) {
    if (child.parentData! is FlexParentData) {
      child.parentData = FlexParentData();
    }
  }

  @override
  void performLayout() {
    double dy = 0.0;
    double maxWidth = 0.0;

    RenderBox? child = firstChild;
    double remainingHeight = constraints.maxHeight;

    while (child != null) {
      final FlexParentData data = child.parentData as FlexParentData;

      child.layout(
        BoxConstraints(
          maxWidth: constraints.maxWidth,
          minWidth: 0,
          minHeight: 0,
          maxHeight: remainingHeight,
        ),
        parentUsesSize: true,
      );

      data.offset = Offset(0, dy);

      dy += child.size.height;
      remainingHeight -= child.size.height;

      maxWidth = max(maxWidth, child.size.width);

      child = data.nextSibling;
    }

    size = Size(maxWidth, dy.clamp(0, constraints.maxHeight));
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    defaultPaint(context, offset);
  }
}
