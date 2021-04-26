import 'package:flutter/material.dart';
import 'package:nlw_flutter/challenge/widgets/quiz_widget.dart';
import 'package:nlw_flutter/core/app_colors.dart';
import 'package:nlw_flutter/home/home_controller.dart';
import 'package:nlw_flutter/home/home_state.dart';
import 'package:nlw_flutter/home/widgets/level_button_widget.dart';

import 'widgets/app_bar_widget.dart';
import 'widgets/quiz_card_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    super.initState();
    controller.getUser();
    controller.getQuizzes();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller.getState(),
      builder: (context, value, child) {
        if (value == HomeState.success) {
          return Scaffold(
            appBar: AppBarWidget(
              user: controller.user!,
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LevelButtonWidget(label: "Fácil"),
                        LevelButtonWidget(label: "Médio"),
                        LevelButtonWidget(label: "Difícil"),
                        LevelButtonWidget(label: "Perito"),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: GridView.count(
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                          crossAxisCount: 2,
                          children: controller.quizzes!
                              .map((quiz) => QuizCardWidget(quizModel: quiz))
                              .toList()),
                    ),
                  )
                ],
              ),
            ),
          );
        } else if (value == HomeState.error) {
          return Scaffold(
            body: Center(
              child: Icon(
                Icons.close,
                color: AppColors.darkRed,
                size: 40,
              ),
            ),
          );
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
              ),
            ),
          );
        }
      },
    );
  }
}
