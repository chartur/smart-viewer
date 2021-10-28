import 'package:flutter/material.dart';
import 'package:flutter_stetho/flutter_stetho.dart';
import 'package:smart_child_viewer/router.dart';

void main() {
  Stetho.initialize();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'NotoSerifArmenian',
          scaffoldBackgroundColor: Color(0xff52C9C9),
          appBarTheme: AppBarTheme(
            color: Color(0xff52C9C9),
            elevation: 0
          ),
          textTheme: TextTheme(
            headline1: TextStyle(
              color: Colors.white,
              letterSpacing: 1.3,
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
            bodyText1: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontFamily: 'NotoSansArmenian',
                fontWeight: FontWeight.normal,
            ),
            bodyText2: TextStyle(
                color: Colors.white,
                fontSize: 14.0,
                fontWeight: FontWeight.normal,
                letterSpacing: 1.3
            ),
            button: TextStyle(
                color: Colors.white,
                fontSize: 14.0,
                fontFamily: 'NotoSansArmenian',
                fontWeight: FontWeight.normal,
                letterSpacing: 1.3
            )
          ),
          accentColor: Colors.pinkAccent,
          primarySwatch: Colors.blue,
          primaryColor: Colors.blue,
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.pinkAccent,
            padding: EdgeInsets.symmetric(vertical: 12.0),
            textTheme: ButtonTextTheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            )
          ),
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
