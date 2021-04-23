import 'package:flutter/material.dart';
import 'package:nlw_flutter/core/core.dart';

class ChartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: double.maxFinite,
            height: double.maxFinite,
            child: CircularProgressIndicator(
              strokeWidth: 10,
              value: .75,
              backgroundColor: AppColors.chartSecondary,
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
            ),
          ),
          Text("75%", style: AppTextStyles.heading),
        ],
      ),
    );
  }
}
