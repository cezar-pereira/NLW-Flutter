import 'package:flutter/material.dart';
import 'package:nlw_flutter/core/app_images.dart';
import 'package:nlw_flutter/home/home_repository.dart';
import 'package:nlw_flutter/home/home_state.dart';
import 'package:nlw_flutter/shared/models/awnser_model.dart';
import 'package:nlw_flutter/shared/models/question_model.dart';
import 'package:nlw_flutter/shared/models/quiz_model.dart';
import 'package:nlw_flutter/shared/models/user_model.dart';

class HomeController {
  final ValueNotifier<HomeState> _state = ValueNotifier(HomeState.empty);
  set state(HomeState state) => this._state.value = state;
  ValueNotifier<HomeState> getState() => this._state;

  UserModel? user;
  List<QuizModel>? quizzes;
  final repository = HomeRepository();

  void getUser() async {
    this.state = HomeState.loading;
    user = await repository.getUser();
    if (user == null) this.state = HomeState.error;
  }

  void getQuizzes() async {
    this.state = HomeState.loading;
    quizzes = await repository.getQuizzes();
    if (quizzes == null)
      this.state = HomeState.error;
    else
      this.state = HomeState.success;
  }
}
