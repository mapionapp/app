class Comment {

  final String text;
  final List<String> tags;

  Comment(this.text, this.tags);

  @override
  String toString() => '$text ($tags)';
}