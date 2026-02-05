import 'package:bare_flutter_ui/presentation/components/book_grid_section.dart';
import 'package:bare_flutter_ui/presentation/components/category_section.dart';
import 'package:bare_flutter_ui/presentation/components/hero_section.dart';
import 'package:bare_flutter_ui/presentation/style/app_colors.dart';
import 'package:bare_flutter_ui/presentation/style/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:bare_flutter_ui/presentation/primitive_widgets/center_widget.dart';
import 'package:bare_flutter_ui/presentation/primitive_widgets/column_widget.dart';
import 'package:bare_flutter_ui/presentation/primitive_widgets/padding_widget.dart';
import 'package:bare_flutter_ui/presentation/primitive_widgets/sized_box_widget.dart';
import 'package:bare_flutter_ui/presentation/primitive_widgets/text_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: ColumnWidget(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBoxWidget(
              height: size.height * 0.05,
              width: size.width,
              child: CenterWidget(
                child: TextWidget(text: "哦艾哦杰伊", style: AppTextStyles.header),
              ),
            ),
            PaddingWidget(
              padding: const EdgeInsets.all(16),
              child: ColumnWidget(
                children: const [
                  CategorySection(),
                  HeroSection(),
                  BookGridSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
