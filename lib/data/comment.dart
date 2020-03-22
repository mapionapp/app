import 'package:w27/data/tag.dart';

class Comment {

  final String text;
  final List<Tag> tags;

  Comment(this.text, this.tags);

  @override
  String toString() => '$text ($tags)';
}