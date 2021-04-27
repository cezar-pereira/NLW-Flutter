import 'package:flutter/material.dart';
import 'package:nlw_flutter/core/core.dart';
import 'package:nlw_flutter/shared/widgets/linear_progress_indicator_widget.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  final int currentPage;
  final int length;

  QuestionIndicatorWidget({required this.currentPage, required this.length});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("Questão ${(currentPage).toString().padLeft(2, '0')}",
                style: AppTextStyles.body),
            Text("de $length", style: AppTextStyles.body),
          ]),
          SizedBox(height: 16),
          LinearProgressIndicatorWidget(value: currentPage / length)
        ],
      ),
    );
  }
}
