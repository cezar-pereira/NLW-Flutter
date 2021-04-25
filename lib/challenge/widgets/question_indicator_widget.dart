import 'package:flutter/material.dart';
import 'package:nlw_flutter/core/core.dart';
import 'package:nlw_flutter/shared/widgets/linear_progress_indicator_widget.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("Questão 04", style: AppTextStyles.body),
            Text("de 10", style: AppTextStyles.body),
          ]),
          SizedBox(height: 16),
          LinearProgressIndicatorWidget(value: 0.4)
        ],
      ),
    );
  }
}
