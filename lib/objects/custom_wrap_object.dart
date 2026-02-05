import 'dart:math';

import 'package:flutter/rendering.dart';

class CustomWrapObject extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, FlexParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox, FlexParentData>,
        DebugOverflowIndicatorMixin {
  @override
  void setupParentData(RenderBox child) {
    if (child.parentData is! FlexParentData) {
      child.parentData = FlexParentData();
    }
  }

  @override
  void performLayout() {
    double maxWidth = 0;

    double maxRowHeight = 0;

    RenderBox? child = firstChild;

    double dy = 0;
    double dx = 0;

    while (child != null) {
      final childParentData = child.parentData as FlexParentData;

      child.layout(constraints.loosen(), parentUsesSize: true);

      if (dx > 0 && (dx + child.size.width) > constraints.maxWidth) {
        dx = 0;
        dy += maxRowHeight;
        maxRowHeight = 0;
      }

      childParentData.offset = Offset(dx, dy);

      dx += child.size.width;

      maxRowHeight = max(maxRowHeight, child.size.height);

      maxWidth = max(maxWidth, dx);

      child = childParentData.nextSibling;
    }

    size = constraints.constrain(Size(maxWidth, dy + maxRowHeight));
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    defaultPaint(context, offset);
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) {
    return defaultHitTestChildren(result, position: position);
  }
}
