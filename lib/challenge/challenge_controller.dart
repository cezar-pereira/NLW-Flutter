import 'package:flutter/cupertino.dart';

class ChallengeController {
  ValueNotifier<int> _currentPage = ValueNotifier<int>(1);
  ValueNotifier<int> getCurrentPage() => this._currentPage;
  set currentPage(int value) => this._currentPage.value = value;

  int correctAnswers = 0;
}
