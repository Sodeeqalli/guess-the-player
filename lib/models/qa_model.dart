import 'package:flutter/material.dart';

class QaModel {
  QaModel(this.myImage, this.answer, this.label);
  final Image myImage;
  final List<String> answer;
  final String label;

  List<String> getShuffledanswers() {
    List<String> shuffledAnswers = List.of(answer);
    shuffledAnswers.shuffle();

    return shuffledAnswers;
  }
}
