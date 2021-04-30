import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nlw_flutter/core/core.dart';
import 'package:nlw_flutter/shared/models/quiz_model.dart';
import 'package:nlw_flutter/shared/widgets/next_button_widget.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {
  final QuizModel quizModel;
  final int correctAnswers;
  late String message;
  late String image;
  final GlobalKey globalKey = GlobalKey();
  ResultPage({Key? key, required this.quizModel, required this.correctAnswers})
      : super(key: key);

  void imageAndMessage() {
    double percent = (correctAnswers / quizModel.questions.length) * 100;
    if (percent > 80) {
      image = AppImages.trophy;
      message = "Parabéns!";
    } else if (percent > 50) {
      image = AppImages.neutral;
      message = "Podes melhorar!";
    } else {
      image = AppImages.sad;
      message = "Poxa, continue praticando.";
    }
  }

  // Future<ui.Image> toImage({double pixelRatio = 1.0}) {
  //   assert(!debugNeedsPaint);
  //   return layer.toImage(Offset.zero & size, pixelRatio: pixelRatio);
  // }

  Future<void> _shareScreenshot(context) async {
    try {
      RenderRepaintBoundary boundary =
          globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      if (boundary.debugNeedsPaint) {
        Timer(Duration(seconds: 1), () => _shareScreenshot(context));
        return null;
      }
      ui.Image image = await boundary.toImage();
      final directory = (await getExternalStorageDirectory())!.path;
      ByteData byteData =
          (await image.toByteData(format: ui.ImageByteFormat.png))!;
      Uint8List pngBytes = byteData.buffer.asUint8List();
      File imgFile = new File('$directory/screenshot.png');
      imgFile.writeAsBytes(pngBytes);
      final RenderBox box = context.findRenderObject();
      Share.shareFiles(['$directory/screenshot.png'],
          subject: "Veja minha pontuação no NLW5Flutter",
          text: "Veja minha pontuação no NLW5Flutter",
          sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
      print(pngBytes);
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    imageAndMessage();
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RepaintBoundary(
                key: globalKey,
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        alignment: Alignment.center,
                        child: Image.asset(image),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Column(
                        children: [
                          Text(
                            message,
                            style: AppTextStyles.heading40,
                            textAlign: TextAlign.center,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: Text.rich(
                              TextSpan(
                                text: "Você concluiu\n",
                                style: AppTextStyles.body,
                                children: [
                                  TextSpan(
                                      text: "${quizModel.title}\n",
                                      style: AppTextStyles.bodyBold),
                                  TextSpan(
                                      text:
                                          "com $correctAnswers de ${quizModel.questions.length} acertos.\n",
                                      style: AppTextStyles.body),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                      width: 200,
                      child: NextButtonWidget.purple(
                          label: "Compartilhar",
                          onTap: () async {
                            _shareScreenshot(context);
                          })),
                  SizedBox(
                    height: 24,
                  ),
                  GestureDetector(
                    child: Text(
                      "Voltar ao início",
                      style: AppTextStyles.bodyBold,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
