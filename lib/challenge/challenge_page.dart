import 'package:flutter/material.dart';
import 'package:nlw_flutter/challenge/challenge_controller.dart';
import 'package:nlw_flutter/challenge/widgets/question_indicator_widget.dart';
import 'package:nlw_flutter/result/resul_page.dart';
import 'package:nlw_flutter/shared/models/quiz_model.dart';
import 'package:nlw_flutter/shared/widgets/next_button_widget.dart';

import 'widgets/quiz_widget.dart';

class ChallengePage extends StatefulWidget {
  final QuizModel quizModel;

  const ChallengePage({Key? key, required this.quizModel}) : super(key: key);
  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();

    pageController.addListener(() {
      controller.currentPage = pageController.page!.round() + 1;
    });
  }

  void nextPage() {
    print("currentPage ${controller.getCurrentPage().value}");
    print("length ${widget.quizModel.questions.length}");
    if (controller.getCurrentPage().value < widget.quizModel.questions.length)
      pageController.nextPage(
          duration: Duration(milliseconds: 300), curve: Curves.linear);
  }

  void isRight(value) {
    if (value) controller.correctAnswers++;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
        valueListenable: controller.getCurrentPage(),
        builder: (context, value, _) => Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(86),
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          icon: Icon(Icons.close),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                      SafeArea(
                          top: true,
                          child: QuestionIndicatorWidget(
                            currentPage: value,
                            length: widget.quizModel.questions.length,
                          )),
                    ],
                  ),
                ),
              ),
              body: Container(
                child: PageView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: pageController,
                  children: widget.quizModel.questions
                      .map((e) => QuizWidget(
                            onSelected: (value) {
                              isRight(value);
                              nextPage();
                            },
                            question: e,
                          ))
                      .toList(),
                ),
              ),
              bottomNavigationBar: SafeArea(
                bottom: true,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  child: ((value) < widget.quizModel.questions.length)
                      ? NextButtonWidget.white(
                          label: "Pular",
                          onTap: nextPage,
                        )
                      : NextButtonWidget.green(
                          label: "Confirmar",
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ResultPage(
                                    quizModel: widget.quizModel,
                                    correctAnswers: controller.correctAnswers,
                                  ),
                                ));
                          },
                        ),
                ),
              ),
            ));
  }
}
