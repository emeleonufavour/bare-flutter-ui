import 'package:bare_flutter_ui/presentation/primitive_widgets/column_widget.dart';
import 'package:bare_flutter_ui/presentation/primitive_widgets/padding_widget.dart';
import 'package:bare_flutter_ui/presentation/primitive_widgets/text_widget.dart';
import 'package:bare_flutter_ui/presentation/style/app_text_styles.dart';
import 'package:flutter/material.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddingWidget(
      padding: const EdgeInsets.only(top: 10, bottom: 30),
      child: ColumnWidget(
        children: [
          TextWidget(text: "Hyundai Originals", style: AppTextStyles.heroTitle),
          TextWidget(text: "哦伊娜哦艾艾弗 西屁娜哦勒开 杰诶儿勒屁哦", style: AppTextStyles.body),
        ],
      ),
    );
  }
}
