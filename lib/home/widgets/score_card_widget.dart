import 'package:flutter/material.dart';
import 'package:nlw_flutter/core/app_colors.dart';
import 'package:nlw_flutter/core/core.dart';
import 'package:nlw_flutter/home/widgets/chart_widget.dart';

class ScoreCardWidget extends StatelessWidget {
  final double percent;
  ScoreCardWidget({required this.percent});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 136,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors.border),
          color: AppColors.white,
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: ChartWidget(
                persent: percent,
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Vamos começar",
                      style: AppTextStyles.heading,
                    ),
                    Text(
                      "Complete os desafios e avance em conhecimento",
                      style: AppTextStyles.body,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
