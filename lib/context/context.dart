import 'package:flutter/foundation.dart';

class Course {
  String name;
  String classTime;
  String professor;
  String period;
  List<Activity> activities;

  Course({
    required this.name,
    required this.classTime,
    required this.professor,
    required this.period,
    required this.activities,
  });
}

class Activity {
  String type;
  double value;
  DateTime date;
  String content;

  Activity({
    required this.type,
    required this.value,
    required this.date,
    required this.content,
  });
}

class User with ChangeNotifier {
  List<Course> courses;

  User({
    List<Course>? courses,
  }) : courses = courses ?? [];

  void addCourse(Course course) {
    courses.add(course);
    notifyListeners();
  }

  void removeCourse(Course course) {
    courses.remove(course);
    notifyListeners();
  }
}
