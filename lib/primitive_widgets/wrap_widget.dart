import 'package:bare_flutter_ui/presentation/render_objects/custom_wrap_object.dart';
import 'package:flutter/material.dart';

class WrapWidget extends MultiChildRenderObjectWidget {
  final double? horizontalSpacing;
  final double? verticalSpacing;
  const WrapWidget({
    super.key,
    super.children,
    this.horizontalSpacing,
    this.verticalSpacing,
  });
  @override
  RenderObject createRenderObject(BuildContext context) {
    return CustomWrapObject(
      horizontalSpacing: horizontalSpacing,
      verticalSpacing: verticalSpacing,
    );
  }

  @override
  void updateRenderObject(
    BuildContext context,
    covariant CustomWrapObject renderObject,
  ) {
    renderObject
      ..horizontalSpacing = horizontalSpacing
      ..verticalSpacing = verticalSpacing;
  }
}
