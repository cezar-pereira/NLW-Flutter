import 'package:flutter/material.dart';
import 'package:nlw_flutter/core/core.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
            decoration: BoxDecoration(gradient: AppGradients.linear),
            child: Center(
              child: Image.asset(AppImages.logo),
            )),
      ),
    );
  }
}
