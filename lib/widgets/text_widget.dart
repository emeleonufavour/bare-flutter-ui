import 'package:bare_flutter_ui/objects/custom_text_object.dart';
import 'package:flutter/material.dart';

class TextWidget extends LeafRenderObjectWidget {
  final String text;
  final TextStyle? style;

  const TextWidget({super.key, required this.text, this.style});
  @override
  RenderObject createRenderObject(BuildContext context) {
    return CustomTextObject(text: text);
  }

  @override
  void updateRenderObject(
    BuildContext context,
    covariant CustomTextObject renderObject,
  ) {
    renderObject
      ..text = text
      ..style = style;
  }
}
