import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'comment_controller.dart';
import 'comment_list_page.dart';

class SecondPage extends StatelessWidget {
  final CommentController _commentController = CommentController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Danau Toba'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Danau Toba',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              'Danau Toba adalah sebuah danau vulkanik dengan luas sekitar 1.130 km persegi (440 sq mi), '
              'yang terletak di Sumatra Utara, Indonesia. Danau ini merupakan danau terbesar di Indonesia '
              'dan Asia Tenggara serta danau terbesar di dunia berdasarkan volume air, serta kedalaman '
              'maksimalnya adalah 505 m (1.657 kaki).',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              'Keindahan alam danau ini sangat memukau, dengan pemandangan pegunungan yang mengelilingi danau '
              'dan pulau-pulau kecil di tengahnya. Di Pulau Samosir, yang terletak di tengah Danau Toba, Anda '
              'dapat menemukan budaya Batak yang kaya dan menikmati keindahan alam yang menakjubkan.',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              'Ayo jelajahi Danau Toba dan nikmati keindahannya!',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Expanded(
                  child: Image.asset('assets/images/image1.png'),
                ),
                Expanded(
                  child: Image.asset('assets/images/image2.png'),
                ),
                Expanded(
                  child: Image.asset('assets/images/image3.png'),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    'Tinggalkan Komentar',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  TextFormField(
                    controller: _commentController.commentController,
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: 'Masukkan komentar Anda',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  ElevatedButton(
                    onPressed: () {
                      _validateAndSendComment(context);
                    },
                    child: Text('Kirim Komentar'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _validateAndSendComment(BuildContext context) {
    String commentText = _commentController.commentController.text;
    if (commentText.isNotEmpty) {
      _showSuccessDialog(context);
    } else {
      _showEmptyCommentAlert(context);
    }
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Berhasil'),
          content: Text('Komentar Anda telah terkirim.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                _sendCommentAndNavigate(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showEmptyCommentAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Peringatan'),
          content: Text('Komentar tidak boleh kosong.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _sendCommentAndNavigate(BuildContext context) {
    String commentText = _commentController.commentController.text;
    Navigator.of(context).pop();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CommentListPage(
          newComment: commentText,
          commentDate: DateTime.now(),
        ),
      ),
    );
    _commentController.commentController.clear();
  }
}
