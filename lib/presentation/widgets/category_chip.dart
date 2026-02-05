import 'package:bare_flutter_ui/presentation/primitive_widgets/container_widget.dart';
import 'package:bare_flutter_ui/presentation/primitive_widgets/text_widget.dart';
import 'package:bare_flutter_ui/presentation/style/app_colors.dart';
import 'package:bare_flutter_ui/presentation/style/app_text_styles.dart';
import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  final String text;
  const CategoryChip({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
      padding: const EdgeInsets.all(12),
      color: AppColors.chipBackground,
      radius: const Radius.circular(24),
      child: TextWidget(text: text, style: AppTextStyles.chipText),
    );
  }
}
