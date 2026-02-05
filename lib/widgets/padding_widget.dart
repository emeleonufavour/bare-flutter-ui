import 'package:bare_flutter_ui/objects/custom_padding_object.dart';
import 'package:flutter/material.dart';

class PaddingWidget extends SingleChildRenderObjectWidget {
  final EdgeInsets padding;
  const PaddingWidget({super.key, required this.padding, super.child});
  @override
  RenderObject createRenderObject(BuildContext context) {
    return CustomPaddingObject(edgeInsets: padding);
  }

  @override
  void updateRenderObject(
    BuildContext context,
    covariant CustomPaddingObject renderObject,
  ) {
    renderObject.padding = padding;
  }
}
