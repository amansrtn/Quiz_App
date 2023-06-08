class Questions {
  const Questions(this.question, this.answers);

  final String question;
  final List<String> answers;

  get text => null;

  List<String> shufflanswer() {
    final shuffledAnswer = List.of(answers);
    shuffledAnswer.shuffle();
    return shuffledAnswer;
  }
}
