import 'package:bare_flutter_ui/objects/custom_wrap_object.dart';
import 'package:flutter/material.dart';

class WrapWidget extends MultiChildRenderObjectWidget {
  const WrapWidget({super.key, super.children});
  @override
  RenderObject createRenderObject(BuildContext context) {
    return CustomWrapObject();
  }
}
