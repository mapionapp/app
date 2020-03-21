class MetaData {

  final String question;
  final String answer;
  final String createdAt;

  MetaData({this.question, this.answer, this.createdAt});

  @override
  String toString() => '$question => $answer';

  static MetaData fromMap(Map<String, dynamic> map) {
    return MetaData(
      question: map['question'],
      answer: map['answer'],
      createdAt: map['createdAt']
    );
  }
}