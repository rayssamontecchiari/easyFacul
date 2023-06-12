import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

class Course {
  final String _id;
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
  }) : _id = Uuid().v4();

  String get id => _id;
  List<Activity> get _activities => activities;

  void addActivity(Activity activity) {
    activities.add(activity);
  }
}

class Activity {
  String type;
  String value; //modificar para double
  String date; //modificar para dateTime
  String content;

  Activity({
    required this.type,
    required this.value,
    required this.date,
    required this.content,
  });
}

class User with ChangeNotifier {
  List<Course> courses = [
    Course(
      name: 'Course 1',
      classTime: '8:00 AM',
      professor: 'Professor A',
      period: 'Spring 2023',
      activities: [
        Activity(
            type: "prova",
            value: "10",
            date: "25/06/2032",
            content: "ordens parciais"),
        Activity(
            type: "trabalho",
            value: "5",
            date: "25/06/2032",
            content: "ordens parciais, ordens parciais , ordens parciais"),
      ],
    ),
    Course(
      name: 'Course 2',
      classTime: '10:00 AM',
      professor: 'Professor B',
      period: 'Fall 2023',
      activities: [],
    ),
    Course(
      name: 'Course 3',
      classTime: '2:00 PM',
      professor: 'Professor C',
      period: 'Summer 2023',
      activities: [],
    ),
    Course(
      name: 'Course 4',
      classTime: '9:00 AM',
      professor: 'Professor D',
      period: 'Spring 2024',
      activities: [],
    ),
    Course(
      name: 'Course 5',
      classTime: '11:00 AM',
      professor: 'Professor E',
      period: 'Fall 2024',
      activities: [],
    ),
    Course(
      name: 'Course 6',
      classTime: '3:00 PM',
      professor: 'Professor F',
      activities: [],
      period: 'Summer 2024',
    ),
    Course(
      name: 'Course 7',
      classTime: '8:30 AM',
      professor: 'Professor G',
      period: 'Spring 2025',
      activities: [],
    ),
    Course(
      name: 'Course 8',
      classTime: '1:00 PM',
      professor: 'Professor H',
      period: 'Fall 2025',
      activities: [],
    ),
    Course(
      name: 'Course 9',
      classTime: '10:30 AM',
      professor: 'Professor I',
      period: 'Summer 2025',
      activities: [],
    ),
    Course(
      name: 'Course 10',
      classTime: '12:00 PM',
      professor: 'Professor J',
      period: 'Spring 2026',
      activities: [],
    ),
  ];

  void addCourse(Course course) {
    courses.add(course);
    notifyListeners();
  }

  void removeCourse(Course course) {
    courses.remove(course);
    notifyListeners();
  }

  void addActivityToCourse(String courseId, Activity activity) {
    Course currentCourse =
        courses.firstWhere((element) => element.id == courseId);

    currentCourse.addActivity(activity);
    notifyListeners();
  }

  List<Activity> getActivitiesFromCourse(String courseId) {
    Course currentCourse =
        courses.firstWhere((element) => element.id == courseId);

    return currentCourse._activities;
  }
}
