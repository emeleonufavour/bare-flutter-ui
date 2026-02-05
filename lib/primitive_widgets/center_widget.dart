import 'package:bare_flutter_ui/presentation/render_objects/custom_center_object.dart';
import 'package:flutter/material.dart';

class CenterWidget extends SingleChildRenderObjectWidget {
  const CenterWidget({super.key, super.child});
  @override
  RenderObject createRenderObject(BuildContext context) {
    return CustomCenterObject();
  }
}
