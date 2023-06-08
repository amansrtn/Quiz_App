import 'package:flutter/material.dart';
import 'Quiz.dart';
import 'all_of_homepage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Widget screenchanger;

  @override
  void initState() {
    screenchanger = Initial(change);
    super.initState();
  }

  void change() {
    setState(() {
      screenchanger = const Quiz();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: screenchanger),
    );
  }
}
