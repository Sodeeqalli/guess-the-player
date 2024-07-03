import 'package:flutter/material.dart';
import 'package:premierleague/data/qa_data.dart';
import 'package:premierleague/screens/homescreen.dart';
import 'package:premierleague/screens/resultscreen.dart';

import './questionscreen.dart';

class PlApp extends StatefulWidget {
  const PlApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return PlAppState();
  }
}

class PlAppState extends State<PlApp> {
  String? screen;
  List<String> chosenAnswer = [];

  void questionscreen() {
    setState(() {
      screen = 'question-screen'; //function that will show the questions screen
    });
  }

  void nextQuestion(String answer) {
    chosenAnswer.add(answer);
    print(chosenAnswer);
    if (chosenAnswer.length == questions.length) {
      setState(() {
        screen = 'result-screen'; //function that will show the questions screen
      });
    }
  }

  void restart() {
    setState(() {
      screen = 'home-screen';
      chosenAnswer = [];
      //function that will show the home screen
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen = HomeScreen(
        start: questionscreen); //assigning active screen to the initial screen
    if (screen == 'question-screen') {
      activeScreen = QuestionScreen(
        next: nextQuestion,
        back: restart,
      ); //assigning active screen to question screen
    } else if (screen == 'result-screen') {
      activeScreen = ResultScreen(
        chosenAnswer: chosenAnswer,
        restart: restart,
      ); //assigning active screen to question screen
    } else if (screen == 'home-screen') {
      activeScreen = HomeScreen(start: questionscreen);
      //assigning active screen to question screen
    }
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 178, 0, 59),
                  Color.fromARGB(255, 255, 120, 165)
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              ),
              child: activeScreen),
        ),
      ),
    );
  }
}
