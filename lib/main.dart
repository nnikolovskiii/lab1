import 'package:flutter/material.dart';
import 'package:lab1/widgets/course_widget.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('206021'),
          backgroundColor: Colors.lightGreen, // Set the background color here
        ),
        body: CoursesListWidget(),
      ),
    );
  }
}
