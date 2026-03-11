class DailyQuizModel {
  const DailyQuizModel({
    required this.id,
    required this.question,
    required this.answers,
    required this.correctAnswerIndex,
    required this.explanation,
  });

  final String id;
  final String question;
  final List<String> answers;
  final int correctAnswerIndex;
  final String explanation;

  factory DailyQuizModel.fromJson(Map<String, dynamic> json) {
    return DailyQuizModel(
      id: json['_id'] as String,
      question: json['question'] as String,
      answers: (json['answers'] as List<dynamic>)
          .map((item) => item.toString())
          .toList(),
      correctAnswerIndex: (json['correctAnswerIndex'] as num).toInt(),
      explanation: json['explanation'] as String,
    );
  }
}
