import 'package:flutter/material.dart';
import 'package:nlw_flutter/challenge/challenge_controller.dart';
import 'package:nlw_flutter/challenge/widgets/next_button_widget.dart';
import 'package:nlw_flutter/challenge/widgets/question_indicator_widget.dart';
import 'package:nlw_flutter/shared/models/question_model.dart';

import 'widgets/quiz_widget.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;

  const ChallengePage({Key? key, required this.questions}) : super(key: key);
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
    print("length ${widget.questions.length}");
    if (controller.getCurrentPage().value < widget.questions.length)
      pageController.nextPage(
          duration: Duration(milliseconds: 300), curve: Curves.linear);
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
                            length: widget.questions.length,
                          )),
                    ],
                  ),
                ),
              ),
              body: Container(
                child: PageView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: pageController,
                  children: widget.questions
                      .map((e) => QuizWidget(
                            onChange: nextPage,
                            question: e,
                          ))
                      .toList(),
                ),
              ),
              bottomNavigationBar: SafeArea(
                bottom: true,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  child: ((value) < widget.questions.length)
                      ? NextButtonWidget.white(
                          label: "Pular",
                          onTap: nextPage,
                        )
                      : NextButtonWidget.green(
                          label: "Confirmar",
                          onTap: () {},
                        ),
                ),
              ),
            ));
  }
}
