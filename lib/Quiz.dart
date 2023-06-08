// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:quiz_app/data/all_questions.dart';
import 'package:quiz_app/models/data_model.dart';

import 'models/result_page.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int question_number = 0;
  List<String> answerList = [];

  void answerkey() {
    setState(() {
      if (questions.length - 1 > question_number) {
        question_number++;
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ResultPage(
                    answerList: answerList,
                  )),
        );
        // answerList = [];
      }
    });
  }

  void choosedAnswer(String answer) {
    answerList.add(answer);
  }

  @override
  Widget build(BuildContext context) {
    Questions ques = questions[question_number];
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
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DefaultTextStyle(
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white),
              child: Text(
                ques.question,
                softWrap: true,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // getting all the buttons from map.. it breaks all the list into individual comma separated values
            // ... is used for that because children accept only widget not a list of widget
            ...ques.shufflanswer().map((answer) {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(137, 2, 2, 9),
                    elevation: 0,
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.only(bottom: 10, top: 10)),
                onPressed: () {
                  answerkey();
                  choosedAnswer(answer);
                },
                child: Text(
                  answer,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                  softWrap: true,
                  textAlign: TextAlign.center,
                ),
              );
            })
            // ElevatedButton(
            //     style: ElevatedButton.styleFrom(
            //         backgroundColor: const Color.fromARGB(139, 26, 19, 120),
            //         elevation: 0,
            //         shape: const StadiumBorder()),
            //     onPressed: () {},
            //     child: Text(
            //       ques.answers[0],
            //       style: const TextStyle(
            //           fontWeight: FontWeight.bold,
            //           fontSize: 25,
            //           color: Colors.white),
            //     )),
            // const SizedBox(
            //   height: 10,
            // ),
            // ElevatedButton(
            //     style: ElevatedButton.styleFrom(
            //         backgroundColor: const Color.fromARGB(139, 26, 19, 120),
            //         elevation: 0,
            //         shape: const StadiumBorder()),
            //     onPressed: () {},
            //     child: Text(
            //       ques.answers[1],
            //       style: const TextStyle(
            //           fontWeight: FontWeight.bold,
            //           fontSize: 25,
            //           color: Colors.white),
            //     )),
            // const SizedBox(
            //   height: 10,
            // ),
            // ElevatedButton(
            //     style: ElevatedButton.styleFrom(
            //         backgroundColor: const Color.fromARGB(139, 26, 19, 120),
            //         elevation: 0,
            //         shape: const StadiumBorder()),
            //     onPressed: () {},
            //     child: Text(
            //       ques.answers[2],
            //       style: const TextStyle(
            //           fontWeight: FontWeight.bold,
            //           fontSize: 25,
            //           color: Colors.white),
            //     )),
            // const SizedBox(
            //   height: 10,
            // ),
            // ElevatedButton(
            //     style: ElevatedButton.styleFrom(
            //         backgroundColor: const Color.fromARGB(139, 26, 19, 120),
            //         elevation: 0,
            //         shape: const StadiumBorder()),
            //     onPressed: () {},
            //     child: Text(
            //       ques.answers[3],
            //       style: const TextStyle(
            //           fontWeight: FontWeight.bold,
            //           fontSize: 25,
            //           color: Colors.white),
            //     ))
          ],
        ),
      ),
    );
  }
}
