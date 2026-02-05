import 'package:flutter/rendering.dart';

class CustomCenterObject extends RenderShiftedBox {
  CustomCenterObject([super.child]);

  @override
  void performLayout() {
    if (child == null) {
      size = constraints.smallest;
      return;
    }

    child!.layout(constraints.loosen(), parentUsesSize: true);

    final parentData = child!.parentData as BoxParentData;

    size = constraints.biggest;

    double newWidth = (size.width - child!.size.width) / 2;
    double newHeigth = (size.height - child!.size.height) / 2;

    parentData.offset = Offset(newWidth, newHeigth);
  }
}
