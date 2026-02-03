import 'package:bare_flutter_ui/objects/custom_row_object.dart';
import 'package:flutter/material.dart';

class RowWidget extends MultiChildRenderObjectWidget {
  const RowWidget({super.key, super.children = const <Widget>[]});

  @override
  RenderObject createRenderObject(BuildContext context) {
    return CustomRowObject();
  }
}
