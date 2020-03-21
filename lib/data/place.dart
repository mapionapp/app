import 'package:w27/data/comment.dart';

class Place {

  final String name;
  final String address;
  final List<Comment> comments;

  Place(this.name, this.address, this.comments);

  @override
  String toString() => '$name ($address): $comments';
}