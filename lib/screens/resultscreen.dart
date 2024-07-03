import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:premierleague/data/qa_data.dart';
import 'package:premierleague/screens/summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.chosenAnswer, required this.restart});
  final List<String> chosenAnswer;
  final void Function() restart;

  List<Map<String, Object>> getSummary() {
    List<Map<String, Object>> questionSummary = [];

    for (var i = 0; i < questions.length; i++) {
      questionSummary.add({
        'question_index': i,
        'image': questions[i].label,
        'chosen_answer': chosenAnswer[i],
        'right_answer': questions[i].answer[0],
      });
    }
    return questionSummary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummary();
    final numCorrectQuestions = summaryData.where((data) {
      return data['chosen_answer'] == data['right_answer'];
    }).length;
    final numTotalQuestion = questions.length;

    return Container(
      margin: const EdgeInsets.all(10),
      child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            Text(
              'You got $numCorrectQuestions out of $numTotalQuestion',
              style: GoogleFonts.kanit(
                fontSize: 40,
                color: const Color.fromARGB(255, 56, 0, 60),
              ),
            ),
            SizedBox(
                height: 600,
                child: Expanded(child: SummaryData(summaryData: getSummary()))),
            TextButton.icon(
              onPressed: restart,
              icon: const Icon(Icons.restart_alt,
                  color: Color.fromARGB(255, 56, 0, 60)),
              label: Text(
                'Restart',
                style: GoogleFonts.kanit(
                    fontSize: 27,
                    color: const Color.fromARGB(255, 56, 0, 60),
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
