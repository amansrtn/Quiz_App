import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/Quiz.dart';
import 'package:quiz_app/data/all_questions.dart';
import 'package:quiz_app/models/question_summary.dart';

// ignore: must_be_immutable
class ResultPage extends StatelessWidget {
  ResultPage({super.key, required this.answerList});
  List<String> answerList;

  List<Map<String, Object>> quizSummary() {
    List<Map<String, Object>> summary = [];
    for (int i = 0; i < answerList.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'user_answer': answerList[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> getsummary = quizSummary();
    final noOfQuestion = questions.length;
    final noOfCorrectAnswer = getsummary.where((data) {
      return data['correct_answer'] == data['user_answer'];
    }).length;
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 3, 3, 32),
          Color.fromARGB(255, 26, 19, 120)
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      height: double.infinity,
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DefaultTextStyle(
              style: const TextStyle(fontSize: 10),
              textAlign: TextAlign.center,
              child: Text(
                "You Correctly Answered $noOfCorrectAnswer Out of $noOfQuestion Questions🥳🥳🥳",
                style:
                    GoogleFonts.lato(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(summary: getsummary),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                  builder: (context) =>const Quiz()));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(139, 26, 19, 120),
                    elevation: 0,
                    shape: const StadiumBorder()),
                icon: const Icon(Icons.refresh),
                label: const Text("Restart Quiz"))
          ],
        ),
      ),
    );
  }
}
