// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSummary extends StatelessWidget {
  QuestionSummary({super.key, required this.summary});
  List<Map<String, Object>> summary = [];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summary.map(
            (data) {
              return DefaultTextStyle(
                style: GoogleFonts.lato(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IndexColor(data: data),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 7,
                            ),
                            Text(
                              (data['question']).toString(),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Text((data['correct_answer']).toString(),
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 25, 223, 32))),
                            const SizedBox(
                              height: 3,
                            ),
                            Text(
                              (data['user_answer']).toString(),
                              style: TextStyle(
                                color: data['correct_answer'] ==
                                        data['user_answer']
                                    ? const Color.fromARGB(255, 25, 223, 32)
                                    : const Color.fromARGB(255, 224, 31, 17),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            )
                          ]),
                    )
                  ],
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}

class IndexColor extends StatelessWidget {
  IndexColor({super.key, required this.data});
  Map<String, Object> data;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: data['correct_answer'] == data['user_answer']
            ? const Color.fromARGB(255, 25, 223, 32)
            : const Color.fromARGB(255, 224, 31, 17),
      ),
      child: Text(
        ((data['question_index'] as int) + 1).toString(),
        style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    );
  }
}
