import 'package:flutter/material.dart';
import 'package:nlw_flutter/challenge/challenge_page.dart';
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
  var listLevels = ["Fácil", "Médio", "Difícil", "Perito"];
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
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Container(
                    height: 35,
                    child: ListView.separated(
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) {
                          return LevelButtonWidget(label: listLevels[index]);
                        },
                        separatorBuilder: (_, __) => SizedBox(width: 8),
                        itemCount: listLevels.length),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: GridView.count(
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        crossAxisCount: 2,
                        children: controller.quizzes!
                            .map((quiz) => QuizCardWidget(
                                  quizModel: quiz,
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ChallengePage(
                                                  questions: quiz.questions,
                                                )));
                                  },
                                ))
                            .toList()),
                  ),
                )
              ],
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
