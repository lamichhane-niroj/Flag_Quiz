import 'package:flag_quiz/quiz_question.dart';
import 'package:flag_quiz/widgets/result_summary.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.userChoosenAnswer, required this.restartQuiz});

  final List<String> userChoosenAnswer;
  final void Function() restartQuiz;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < userChoosenAnswer.length; i++) {
      summary.add({
        "question_index": i + 1,
        "question": question[i].flagUrl,
        "answer": question[i].options[0],
        "user_answer": userChoosenAnswer[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final finalData = summaryData;
    var correctAnswer = finalData
        .where((element) => element["answer"] == element["user_answer"]);

    return Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        // conclusion
        Text(
          "You got ${correctAnswer.length} out of ${question.length} correct answers",
          style: const TextStyle(
              fontSize: 22, fontWeight: FontWeight.w600, color: Colors.white),
        ),

        const SizedBox(
          height: 50,
        ),

        // question answer set
        ResultSummary(
          summaryData: finalData,
        ),

        const SizedBox(
          height: 20,
        ),

        // replay button
        ElevatedButton.icon(
          icon: const Icon(Icons.restart_alt),
          label: const Text("Restart Quiz"),
          onPressed: restartQuiz,
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 49, 21, 98)),
        ),
      ]),
    );
  }
}
