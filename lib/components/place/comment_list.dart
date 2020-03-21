import 'package:flutter/material.dart';
import 'package:w27/data/comment.dart';

class CommentList extends StatelessWidget {

  final List<Comment> comments;

  const CommentList({Key key, this.comments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: comments.map((c) =>
        Container(
          child: Text(c.text),
        )
      ).toList(),
    );
  }
}
