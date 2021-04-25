import 'package:flutter/material.dart';
import 'package:nlw_flutter/core/core.dart';
import 'package:nlw_flutter/shared/widgets/linear_progress_indicator_widget.dart';

class QuizCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.fromBorderSide(BorderSide(color: AppColors.border)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40,
            width: 40,
            child: Image.asset(AppImages.blocks),
          ),
          Text(
            "Gerenciamento de estado",
            style: AppTextStyles.heading15,
          ),
          Row(
            children: [
              Text("3 de 10"),
              SizedBox(width: 16),
              Expanded(
                child: LinearProgressIndicatorWidget(value: 0.3),
              ),
            ],
          )
        ],
      ),
    );
  }
}
