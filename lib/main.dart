import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proyek1/screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: (context, child) {
        return MaterialApp(
          title: 'Mobile Lake Danau Toba',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Screen(),
        );
      },
    );
  }
}
