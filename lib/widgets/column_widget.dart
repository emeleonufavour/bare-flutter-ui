import 'package:bare_flutter_ui/objects/custom_column_object.dart';
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
    return CustomColumnObject();
  }

  @override
  void updateRenderObject(
    BuildContext context,
    covariant CustomColumnObject renderObject,
  ) {
    super.updateRenderObject(context, renderObject);
  }
}
