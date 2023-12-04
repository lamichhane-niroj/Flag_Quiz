import 'package:flutter/material.dart';

class ResultSummary extends StatelessWidget {
  const ResultSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((e) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.only(left: 50),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: e['answer'] == e['user_answer']
                              ? Colors.green
                              : Colors.red),
                      child: Text(
                        ((e['question_index'].toString())),
                      ),
                    ),
                    const SizedBox(
                      width: 80,
                    ),
                    Image.asset(
                      e["question"].toString(),
                      width: 100,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Your Answer:  ${e["user_answer"].toString()}",
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
                Text(
                  "Correct Answer:  ${e["answer"].toString()}",
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
