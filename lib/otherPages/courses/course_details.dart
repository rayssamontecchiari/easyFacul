import 'package:easy_facul/context/context.dart';
import 'package:easy_facul/otherPages/activities/add_activity.dart';
import 'package:easy_facul/otherPages/activities/view_activities.dart';
import 'package:easy_facul/otherPages/courses/add_course.dart';
import 'package:easy_facul/utils/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class courseDetails extends StatefulWidget {
  final Course currentCourse;

  courseDetails({Key? key, required this.currentCourse}) : super(key: key);

  @override
  _courseDetailsState createState() => _courseDetailsState();
}

class _courseDetailsState extends State<courseDetails> {
  @override
  Widget build(BuildContext context) {
    // final dataProvider = Provider.of<User>(context);
    String professor = widget.currentCourse.professor;
    String period = widget.currentCourse.period;
    String classTime = widget.currentCourse.classTime;

    return Scaffold(
      appBar: AppBarCustom(
        textTitle: widget.currentCourse.name,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Center(
                child: Text(
                  "Informações do curso",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Professor: $professor"),
                    Text("Período: $period")
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 4,
                decoration: BoxDecoration(
                  color: Colors.blue[200],
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.blue,
                    width: 2,
                  ),
                ),
                child: Center(child: Text(classTime)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => viewActivities(
                                idCurrentCourse: widget.currentCourse.id,
                              ),
                            ),
                          )
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.purple[300],
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: Colors.purple,
                              width: 2,
                            ),
                          ),
                          height: 100,
                          child: const Center(
                            child: Text(
                              "VER ATIVIDADES",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: InkWell(
                        onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => AddActivity(
                                idCurrentCourse: widget.currentCourse.id,
                              ),
                            ),
                          )
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.amber[300],
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: Colors.amber,
                              width: 2,
                            ),
                          ),
                          height: 100,
                          child: const Center(
                            child: Text(
                              "ADICIONAR ATIVIDADES",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
