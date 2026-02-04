import 'package:bare_flutter_ui/objects/custom_container_object.dart';
import 'package:flutter/material.dart';

class ContainerWidget extends LeafRenderObjectWidget {
  final double width;
  final double height;
  final Color? color;

  const ContainerWidget({
    super.key,
    required this.width,
    required this.height,
    this.color,
  });

  @override
  RenderObject createRenderObject(BuildContext context) {
    return CustomBoxObject(width: width, height: height, color: color);
  }

  @override
  void updateRenderObject(
    BuildContext context,
    covariant CustomBoxObject renderObject,
  ) {
    renderObject
      ..color = color ?? Colors.transparent
      ..height = height
      ..width = width;
  }
}
