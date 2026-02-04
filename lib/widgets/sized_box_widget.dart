import 'package:bare_flutter_ui/objects/custom_sized_box_object.dart';
import 'package:flutter/material.dart';

class SizedBoxWidget extends SingleChildRenderObjectWidget {
  final double height;
  final double width;

  const SizedBoxWidget({
    super.key,
    required this.height,
    required this.width,
    super.child,
  });
  @override
  RenderObject createRenderObject(BuildContext context) {
    return CustomSizedBoxObject(height: height, width: width);
  }

  @override
  void updateRenderObject(
    BuildContext context,
    covariant CustomSizedBoxObject renderObject,
  ) {
    renderObject
      ..height = height
      ..width = width;
  }
}
