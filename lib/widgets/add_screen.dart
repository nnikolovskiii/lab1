// add_course_screen.dart

import 'package:flutter/material.dart';

class AddCourseScreen extends StatelessWidget {
  final TextEditingController courseNameController = TextEditingController();
  final TextEditingController professorNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Course'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: courseNameController,
              decoration: InputDecoration(labelText: 'Course Name'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: professorNameController,
              decoration: InputDecoration(labelText: 'Professor Name'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                String courseName = courseNameController.text;
                String professorName = professorNameController.text;

                if (courseName.isNotEmpty && professorName.isNotEmpty) {
                  Map<String, String> result = {
                    'courseName': courseName,
                    'professorName': professorName,
                  };

                  Navigator.pop(context, result);
                }
              },
              child: Text('Add Course'),
            ),
          ],
        ),
      ),
    );
  }
}
