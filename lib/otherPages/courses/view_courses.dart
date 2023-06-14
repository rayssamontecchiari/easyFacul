import 'package:easy_facul/context/context.dart';
import 'package:easy_facul/otherPages/courses/course_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/app_bar.dart';

class viewCourse extends StatefulWidget {
  viewCourse({Key? key}) : super(key: key);

  @override
  _viewCourseState createState() => _viewCourseState();
}

class _viewCourseState extends State<viewCourse> {
  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<User>(context);
    final _userList = dataProvider.courses;
    int totalOfCourses = _userList.length;

    return Scaffold(
      appBar: AppBarCustom(
        textTitle: "Turmas em curso",
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 16),
              child: Text(
                "Você possui $totalOfCourses curso(s)",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _userList.length,
                itemBuilder: (BuildContext context, int index) {
                  var item = _userList[index];
                  var randomColor =
                      Colors.primaries[index % Colors.primaries.length];

                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => courseDetails(currentCourse: item),
                        ),
                      );
                    },
                    child: Container(
                      color: randomColor,
                      padding: EdgeInsets.all(16),
                      child: ListTile(
                        title: Text(
                          item.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
