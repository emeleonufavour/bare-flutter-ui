import 'package:bare_flutter_ui/data/models/book_model.dart';
import 'package:bare_flutter_ui/presentation/primitive_widgets/column_widget.dart';
import 'package:bare_flutter_ui/presentation/primitive_widgets/container_widget.dart';
import 'package:bare_flutter_ui/presentation/primitive_widgets/sized_box_widget.dart';
import 'package:bare_flutter_ui/presentation/primitive_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final Book book;
  const BookCard({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return ColumnWidget(
      children: [
        ContainerWidget(
          height: 150,
          width: 100,
          color: book.color,
          radius: const Radius.circular(16),
        ),
        SizedBoxWidget(height: 5),
        TextWidget(
          text: book.title,
          style: const TextStyle(color: Colors.black),
        ),
      ],
    );
  }
}
