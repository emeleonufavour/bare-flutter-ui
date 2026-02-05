import 'package:bare_flutter_ui/presentation/render_objects/custom_row_object.dart';
import 'package:flutter/material.dart';

class RowWidget extends MultiChildRenderObjectWidget {
  final double? spacing;
  const RowWidget({super.key, super.children = const <Widget>[], this.spacing});

  @override
  RenderObject createRenderObject(BuildContext context) {
    return CustomRowObject(spacing: spacing);
  }

  @override
  void updateRenderObject(
    BuildContext context,
    covariant CustomRowObject renderObject,
  ) {
    renderObject.spacing = spacing;
  }
}
