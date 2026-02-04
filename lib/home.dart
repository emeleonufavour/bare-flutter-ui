import 'package:bare_flutter_ui/widgets/center_widget.dart';
import 'package:bare_flutter_ui/widgets/column_widget.dart';
import 'package:bare_flutter_ui/widgets/container_widget.dart';
import 'package:bare_flutter_ui/widgets/sized_box_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: ColumnWidget(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBoxWidget(
              height: size.height * 0.08,
              width: size.width,
              child: CenterWidget(
                child: Text(
                  "LOREM",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ContainerWidget(width: 100, height: 100, color: Colors.red),
          ],
        ),
      ),
    );
  }
}
