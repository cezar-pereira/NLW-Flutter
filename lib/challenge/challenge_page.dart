import 'package:flutter/material.dart';
import 'package:nlw_flutter/challenge/widgets/awnser_widget.dart';
import 'package:nlw_flutter/challenge/widgets/question_indicator_widget.dart';

import 'widgets/quiz_widget.dart';

class ChallengePage extends StatefulWidget {
  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: SafeArea(top: true, child: QuestionIndicatorWidget()),
      ),
      body: Container(
        child: Column(
          children: [
            QuizWidget(
              title: "O que o Flutter faz em sua totalidade?",
            ),
            AwnserWidget(
                isSelected: true,
                title:
                    "Possibilita a criação de aplicativos compilados nativamente."),
            AwnserWidget(
                isRight: true,
                title:
                    "Possibilita a criação de aplicativos compilados nativamente."),
            AwnserWidget(
                title:
                    "Possibilita a criação de aplicativos compilados nativamente."),
            AwnserWidget(
                title:
                    "Possibilita a criação de aplicativos compilados nativamente."),
          ],
        ),
      ),
    );
  }
}
