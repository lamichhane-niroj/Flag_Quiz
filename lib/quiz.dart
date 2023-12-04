import 'package:flag_quiz/quiz_question.dart';
import 'package:flag_quiz/screens/home_screen.dart';
import 'package:flag_quiz/screens/question_screen.dart';
import 'package:flag_quiz/screens/result_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var currentScreen = "home_screen";
  List<String> userAnswer = [];

  void changeScreen() {
    setState(() {
      currentScreen = "question_screen";
    });
  }

  void updateUserAnswer(String answer) {
    userAnswer.add(answer);

    if (userAnswer.length == question.length) {
      setState(() {
        currentScreen = "result_screen";
      });
    }
  }

  void restartGame() {
    setState(() {
      userAnswer = [];
      currentScreen = "question_screen";
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget currentWidget = HomeScreen(onTap: changeScreen);

    if (currentScreen == "question_screen") {
      currentWidget = QuestionScreen(checkQuestion: updateUserAnswer);
    }

    if (currentScreen == "result_screen") {
      currentWidget = ResultScreen(
        userChoosenAnswer: userAnswer,
        restartQuiz: restartGame,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 54, 24, 105),
              Color.fromARGB(143, 48, 15, 105),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: currentWidget,
        ),
      ),
    );
  }
}
