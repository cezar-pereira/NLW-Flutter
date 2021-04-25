import 'package:flutter/material.dart';
import 'package:nlw_flutter/core/core.dart';

class LinearProgressIndicatorWidget extends StatelessWidget {
  final double value;

  const LinearProgressIndicatorWidget({Key? key, required this.value})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: value,
      backgroundColor: AppColors.chartSecondary,
      valueColor: AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
    );
  }
}
