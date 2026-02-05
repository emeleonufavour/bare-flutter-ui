import 'dart:math';

import 'package:flutter/rendering.dart';

class CustomRowObject extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, FlexParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox, FlexParentData>,
        DebugOverflowIndicatorMixin {
  double? _spacing;

  CustomRowObject({double? spacing}) : _spacing = spacing;

  double? get spacing => _spacing;

  set spacing(double? val) {
    if (val != _spacing) {
      _spacing = val;
      markNeedsLayout();
    }
  }

  @override
  void setupParentData(covariant RenderObject child) {
    if (child.parentData is! FlexParentData) {
      child.parentData = FlexParentData();
    }
  }

  @override
  void performLayout() {
    double dx = 0.0;
    double maxHeight = 0.0;

    RenderBox? child = firstChild;

    while (child != null) {
      final ContainerBoxParentData<RenderBox> parentData =
          child.parentData as ContainerBoxParentData<RenderBox>;

      child.layout(constraints.loosen(), parentUsesSize: true);

      parentData.offset = Offset(dx, 0);

      maxHeight = max(maxHeight, child.size.height);

      dx += child.size.width + (_spacing ?? 0);
      child = parentData.nextSibling;
    }

    size = Size(dx, maxHeight);
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
