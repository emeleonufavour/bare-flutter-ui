import 'dart:math';

import 'package:flutter/rendering.dart';

class CustomContainerObject extends RenderBox
    with RenderObjectWithChildMixin<RenderBox> {
  double? _width;
  double? _height;
  Color? _color;
  Radius? _radius;
  EdgeInsets? _padding;

  CustomContainerObject({
    double? width,
    double? height,
    Color? color,
    Radius? radius,
    EdgeInsets? padding = EdgeInsets.zero,
  }) : _color = color,
       _height = height,
       _width = width,
       _padding = padding,
       _radius = radius;

  double? get width => _width;
  double? get height => _height;
  Color? get color => _color;
  Radius? get radius => _radius;
  EdgeInsets? get padding => _padding;

  set width(double? val) {
    if (val != _width) {
      _width = val;
      markNeedsLayout();
    }
  }

  set height(double? val) {
    if (val != _height) {
      _height = val;
      markNeedsLayout();
    }
  }

  set color(Color? val) {
    if (val != _color) {
      _color = val;
      markNeedsPaint();
    }
  }

  set radius(Radius? radius) {
    if (radius != _radius) {
      _radius = radius;
      markNeedsPaint();
    }
  }

  set padding(EdgeInsets? val) {
    if (val != _padding) {
      _padding = val;
      markNeedsLayout();
    }
  }

  @override
  void performLayout() {
    if (child == null) {
      size = constraints.constrain(Size((_width ?? 0), (_height ?? 0)));

      return;
    } else {
      final resolvedPadding = padding ?? EdgeInsets.zero;

      BoxConstraints? childConstraints = constraints.deflate(resolvedPadding);

      if (_height != null) {
        childConstraints = childConstraints.tighten(
          height: max(0, _height! - resolvedPadding.vertical),
        );
      }

      if (_width != null) {
        childConstraints = childConstraints.tighten(
          width: max(0, _width! - resolvedPadding.horizontal),
        );
      }

      child!.layout(childConstraints, parentUsesSize: true);

      final double finalWidth =
          _width ?? (child!.size.width + resolvedPadding.horizontal);

      final double finalHeight =
          _height ?? (child!.size.height + resolvedPadding.vertical);

      size = constraints.constrain(Size(finalWidth, finalHeight));

      final childParentData = child!.parentData as BoxParentData;
      childParentData.offset = Offset(
        resolvedPadding.left,
        resolvedPadding.top,
      );
    }
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    if (_color != null) {
      final Paint paint = Paint()..color = _color!;
      final Rect rect = offset & size;

      if (_radius != null) {
        context.canvas.drawRRect(
          RRect.fromRectAndRadius(rect, _radius!),
          paint,
        );
      } else {
        context.canvas.drawRect(rect, paint);
      }
    }

    if (child != null) {
      final BoxParentData childParentData = child!.parentData as BoxParentData;
      context.paintChild(child!, offset + childParentData.offset);
    }
  }
}
