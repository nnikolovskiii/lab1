import 'package:flutter/material.dart';
import '../db/courses.dart';
import '../models/course.dart';
import 'add_screen.dart';

class CourseWidget extends StatelessWidget {
  final Course course;
  final VoidCallback onDelete;

  CourseWidget({required this.course, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (_) => onDelete(),
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: EdgeInsets.all(10),
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      direction: DismissDirection.endToStart,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // Ensure children fill horizontally
          children: [
            Text(
              '${course.name}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Professor: ${course.professor}',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CoursesListWidget extends StatefulWidget {
  @override
  _CoursesListWidgetState createState() => _CoursesListWidgetState();
}

class _CoursesListWidgetState extends State<CoursesListWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My courses'),
      ),
      body: Container(
        width: double.infinity, // Set the container to fill the available horizontal space
        child: ListView.builder(
          itemCount: courses.length,
          itemBuilder: (context, index) {
            return CourseWidget(
              course: courses[index],
              onDelete: () {
                setState(() {
                  courses.removeAt(index);
                });
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddCourseScreen()),
          );

          if (result != null) {
            // Add the new course with the professor to the list
            setState(() {
              courses.add(Course(
                name: result['courseName'] ?? '',
                professor: result['professorName'] ?? '',
                id: '',
              ));
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
