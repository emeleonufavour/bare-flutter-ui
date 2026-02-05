import 'package:bare_flutter_ui/data/models/book_model.dart';
import 'package:bare_flutter_ui/presentation/primitive_widgets/column_widget.dart';
import 'package:bare_flutter_ui/presentation/primitive_widgets/sized_box_widget.dart';
import 'package:bare_flutter_ui/presentation/primitive_widgets/text_widget.dart';
import 'package:bare_flutter_ui/presentation/primitive_widgets/wrap_widget.dart';
import 'package:bare_flutter_ui/presentation/style/app_text_styles.dart';
import 'package:bare_flutter_ui/presentation/widgets/book_card.dart';
import 'package:flutter/material.dart';

class BookGridSection extends StatelessWidget {
  const BookGridSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ColumnWidget(
      children: [
        TextWidget(text: "Premium", style: AppTextStyles.sectionTitle),
        SizedBoxWidget(height: 15),
        WrapWidget(
          verticalSpacing: 15,
          horizontalSpacing: 15,
          children: MockData.books.map((book) => BookCard(book: book)).toList(),
        ),
      ],
    );
  }
}
