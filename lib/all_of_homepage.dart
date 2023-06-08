import 'package:flutter/material.dart';

class Initial extends StatelessWidget {
  const Initial(this.startquiz, {super.key});
  final void Function() startquiz;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 3, 3, 32),
          Color.fromARGB(255, 26, 19, 120)
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Immage(),
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Learn Flutter The Fun Way...",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton.icon(
              onPressed: () {
                startquiz();
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(139, 26, 19, 120),
                  elevation: 0,
                  shape: const StadiumBorder()),
              icon: const Icon(Icons.ads_click_rounded),
              label: const Text(
                "Start Quiz",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Immage extends StatelessWidget {
  const Immage({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/quiz-logo.png',
        width: 350,
      ),
    );
  }
}
