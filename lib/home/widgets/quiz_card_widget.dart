import 'package:flutter/material.dart';
import 'package:nlw_flutter/core/core.dart';
import 'package:nlw_flutter/shared/models/quiz_model.dart';
import 'package:nlw_flutter/shared/widgets/linear_progress_indicator_widget.dart';

class QuizCardWidget extends StatelessWidget {
  final QuizModel quizModel;

  QuizCardWidget({required this.quizModel});

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
            quizModel.title,
            style: AppTextStyles.heading15,
          ),
          Row(
            children: [
              Text(
                  "${quizModel.questionsAnswered} de ${quizModel.questions.length}"),
              SizedBox(width: 16),
              Expanded(
                child: LinearProgressIndicatorWidget(
                    value: quizModel.questionsAnswered /
                        quizModel.questions.length),
              ),
            ],
          )
        ],
      ),
    );
  }
}
