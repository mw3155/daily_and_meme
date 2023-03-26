import 'package:daily_and_meme/ChuckNorrisPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ScoreboardPage.dart';
import 'Util.dart';
import 'GetToWorkPage.dart';
import 'ZebraPage.dart';
import 'HomePage.dart';
import 'TimerPage.dart';
import 'MemePage.dart';
import 'QuizGame/QuizTimePage.dart';

void main() {
  resetGlobalVariablesAsync().then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Daily and Meme',
      builder: (context, child) {
        // init font size
        myResponsiveFontSize =
            MediaQuery.of(context).size.height / myFontSizeScaleFactor;

        return Theme(
          data: ThemeData(
            backgroundColor: Colors.amber,
            scaffoldBackgroundColor: Colors.blueGrey,
            bottomAppBarColor: Colors.amber,
            dialogBackgroundColor: Colors.blueGrey,
            primarySwatch: Colors.amber,
            textTheme: GoogleFonts.robotoMonoTextTheme(textTheme).copyWith(
              bodyText1: GoogleFonts.robotoMono(fontSize: myResponsiveFontSize),
              bodyText2: GoogleFonts.robotoMono(fontSize: myResponsiveFontSize),
              caption: GoogleFonts.robotoMono(fontSize: myResponsiveFontSize),
              button: GoogleFonts.robotoMono(fontSize: myResponsiveFontSize),
              headline6: GoogleFonts.robotoMono(fontSize: myResponsiveFontSize),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(primary: Colors.amber),
            ),
            // primaryColor only for appbar on smartphone?
            primaryColor: Colors.blueGrey,
          ),
          child: child!,
        );
      },
      initialRoute: "/",
      routes: {
        "/": (context) => HomePage(),
        "timer": (context) => TimerPage(),
        "scoreboard": (context) => ScoreboardPage(),
        "meme": (context) => MemePage(),
        "work": (context) => GetToWorkPage(),
        "zebra": (context) => ZebraPage(),
        "chucknorris": (context) => ChuckNorrisPage(),
        "quizpage": (context) => QuizTimePage(),
      },
    );
  }
}
