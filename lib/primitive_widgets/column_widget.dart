import 'package:bare_flutter_ui/presentation/render_objects/custom_column_object.dart';
import 'package:flutter/material.dart';

class ColumnWidget extends MultiChildRenderObjectWidget {
  final CrossAxisAlignment? crossAxisAlignment;
  const ColumnWidget({
    super.key,
    super.children = const <Widget>[],
    this.crossAxisAlignment,
  });

  @override
  RenderObject createRenderObject(BuildContext context) {
    return CustomColumnObject(
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
    );
  }

  @override
  void updateRenderObject(
    BuildContext context,
    CustomColumnObject renderObject,
  ) {
    renderObject.crossAxisAlignment =
        crossAxisAlignment ?? CrossAxisAlignment.start;
  }
}
