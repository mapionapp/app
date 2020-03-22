import 'package:w27/data/comment.dart';

class Place {

  final String id;
  final String name;
  final String address;
  final List<Comment> comments;

  Place(this.id, this.name, this.address, this.comments);

  @override
  String toString() => '$name ($address): $comments';
}