import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.start});
  final void Function() start;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 60,
        ),
        Image.asset(
          'assets/images/pl logo.png',
          scale: 7.0,
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          'Guess the Player',
          style: GoogleFonts.kanit(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 56, 0, 60)),
        ),
        const SizedBox(
          height: 40,
        ),
        OutlinedButton(
            onPressed: start,
            style: OutlinedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 56, 0, 60),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30))),
            child: Text(
              'Start Game',
              style: GoogleFonts.kanit(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink),
            )),
        const SizedBox(
          height: 104,
        ),
        Text(
          'PREMIER LEAGUE ',
          style: GoogleFonts.kanit(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 56, 0, 60)),
        ),
        Text(
          'EDITION',
          style: GoogleFonts.kanit(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 56, 0, 60)),
        ),
        const SizedBox(
          height: 100,
        ),
        Row(
          children: [
            Image.asset(
              'assets/images/kdb.png',
              scale: 2.60,
            ),
            Image.asset(
              'assets/images/salah.png',
              scale: 2.60,
            )
          ],
        )
      ],
    );
  }
}
