import 'package:flutter/material.dart';
import 'package:premierleague/data/qa_data.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({
    super.key,
    required this.next,
    required this.back,
  });
  final void Function(String answer) next;
  final void Function() back;

  @override
  State<StatefulWidget> createState() {
    return QuestionScreenState();
  }
}

class QuestionScreenState extends State<QuestionScreen> {
  int questionIndex = 0;
  int questionsLenght = questions.length - 1;

  void nextQuestion(String selectedAnswers) {
    widget.next(selectedAnswers);

    if (questionIndex < questionsLenght) {
      setState(() {
        questionIndex++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: Column(
        children: [
          Row(children: [
            const SizedBox(
              height: 80,
            ),
            OutlinedButton(
                onPressed: widget.back,
                style: OutlinedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 56, 0, 60),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40))),
                child: Text(
                  'Restart',
                  style: GoogleFonts.kanit(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 217, 70, 119)),
                ))
          ]),
          const SizedBox(
            height: 100,
          ),
          Expanded(child: questions[questionIndex].myImage),
          ...questions[questionIndex].getShuffledanswers().map((answer) {
            return Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () {
                      nextQuestion(answer);
                    },
                    style: OutlinedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 56, 0, 60),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40))),
                    child: Text(
                      answer,
                      style: GoogleFonts.kanit(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 217, 70, 119)),
                    )),
              ),
            );
          }),
          Image.asset('assets/images/pllogo2.png', scale: 6.0),
        ],
      ),
    );
  }
}
