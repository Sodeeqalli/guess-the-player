import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryData extends StatelessWidget {
  const SummaryData({super.key, required this.summaryData});
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    Color color;
    return SizedBox(
      height: 20,
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: summaryData.map(
              (data) {
                if (data['chosen_answer'] == data['right_answer']) {
                  color = const Color.fromARGB(255, 3, 170, 0);
                } else {
                  color = const Color.fromARGB(255, 175, 12, 0);
                }
                return Row(
                  children: [
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: color),
                        child: Center(
                          child: Text(
                            ((data['question_index'] as int) + 1).toString(),
                            style: GoogleFonts.kanit(fontSize: 30),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 100),
                    Center(
                      child: Expanded(
                        child: Column(children: [
                          Center(
                            child: SizedBox(
                                height: 150,
                                width: 200,
                                child: Image.asset(data['image'] as String)),
                          ),
                          Text(
                            data['chosen_answer'] as String,
                            style: GoogleFonts.kanit(
                                fontSize: 17,
                                color: color,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            data['right_answer'] as String,
                            style: GoogleFonts.kanit(
                                fontSize: 17,
                                color: const Color.fromARGB(255, 56, 0, 60),
                                fontWeight: FontWeight.bold),
                          )
                        ]),
                      ),
                    )
                  ],
                );
              },
            ).toList(),
          ),
        ),
      ),
    );
  }
}
