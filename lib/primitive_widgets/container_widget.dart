import 'package:bare_flutter_ui/presentation/render_objects/custom_container_object.dart';
import 'package:flutter/material.dart';

class ContainerWidget extends SingleChildRenderObjectWidget {
  final double? width;
  final double? height;
  final Color? color;
  final Radius? radius;
  final EdgeInsets? padding;

  const ContainerWidget({
    super.key,
    super.child,
    this.width,
    this.height,
    this.radius,
    this.color,
    this.padding,
  });

  @override
  RenderObject createRenderObject(BuildContext context) {
    return CustomContainerObject(
      width: width,
      height: height,
      color: color,
      radius: radius,
      padding: padding,
    );
  }

  @override
  void updateRenderObject(
    BuildContext context,
    covariant CustomContainerObject renderObject,
  ) {
    renderObject
      ..color = color ?? Colors.transparent
      ..height = height
      ..width = width
      ..padding = padding
      ..radius = radius;
  }
}
