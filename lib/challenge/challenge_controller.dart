import 'package:flutter/cupertino.dart';

class ChallengeController {
  ValueNotifier<int> _currentPage = ValueNotifier<int>(1);
  set currentPage(int value) => this._currentPage.value = value;
  ValueNotifier<int> getCurrentPage() => this._currentPage;
}
