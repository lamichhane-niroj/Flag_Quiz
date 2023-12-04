import 'package:flag_quiz/quiz_question.dart';
import 'package:flag_quiz/widgets/my_custom_button.dart';
import 'package:flutter/material.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.checkQuestion});

  final void Function(String answer) checkQuestion;

  @override
  State<StatefulWidget> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestioNo = 0;

  // change question
  void changeQuestion(String answer) {
    widget.checkQuestion(answer);
    setState(() {
      currentQuestioNo++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var currentQuestion = question[currentQuestioNo];

    return Center(
      child: Container(
        margin: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              currentQuestion.flagUrl,
            ),
            const SizedBox(
              height: 20,
            ),
            ...currentQuestion.suffledAnswer.map(
              (e) => MyCustomButton(
                answer: e,
                onTap: () {
                  changeQuestion(e);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
