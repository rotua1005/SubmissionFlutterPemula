import 'package:flutter/material.dart';

class CommentListPage extends StatefulWidget {
  final String newComment;
  final DateTime commentDate;

  CommentListPage({Key? key, required this.newComment, required this.commentDate}) : super(key: key);

  @override
  _CommentListPageState createState() => _CommentListPageState();
}

class _CommentListPageState extends State<CommentListPage> {
  List<CommentItem> comments = [];

  @override
  void initState() {
    super.initState();
    // Menambahkan komentar awal
    addComment(widget.newComment, widget.commentDate);
  }

  void addComment(String comment, DateTime date) {
    setState(() {
      comments.add(CommentItem(comment: comment, date: date));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comments'),
      ),
      body: ListView.builder(
        itemCount: comments.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(comments[index].comment),
            subtitle: Text("Date: ${comments[index].date.toString()}"),
          );
        },
      ),
    );
  }
}

class CommentItem {
  final String comment;
  final DateTime date;

  CommentItem({required this.comment, required this.date});
}
