import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class PlayerScreen extends StatefulWidget {
  @override
  _PlayerScreenState createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {

  bool showQuiz = false;

  initQuizSettings() {
    Future.delayed(Duration(seconds: 3), () => {
      setState((){
        showQuiz = true;
      })
    });
  }

  @override
  void initState() {
    super.initState();
    initQuizSettings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: getBody(),
    );
  }

  Widget getBody() {
    return Stack(
      children: [
        InAppWebView(
          initialUrl: 'https://m.youtube.com',
        ),
        if(showQuiz)
          showQuizWidget()
      ],
    );
  }

  Widget showQuizWidget() {
    return Positioned(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      top: 0,
      left: 0,
      child: Container(
        color: Colors.black.withOpacity(0.6),
      ),
    );
  }
}
