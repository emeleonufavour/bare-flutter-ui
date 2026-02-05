import 'package:bare_flutter_ui/data/models/book_model.dart';
import 'package:bare_flutter_ui/presentation/primitive_widgets/row_widget.dart';
import 'package:bare_flutter_ui/presentation/widgets/category_chip.dart';
import 'package:flutter/material.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return RowWidget(
      spacing: 10,
      children: MockData.categories
          .map((text) => CategoryChip(text: text))
          .toList(),
    );
  }
}
