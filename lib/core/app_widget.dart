import 'package:flutter/material.dart';
import 'package:nlw_flutter/home/home_page.dart';
import 'package:nlw_flutter/home/widgets/app_bar_widget.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "nlw_flutter",
      home: Scaffold(
        appBar: AppBarWidget(),
        body: HomePage(),
      ),
    );
  }
}
