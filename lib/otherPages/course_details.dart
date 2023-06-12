import 'package:easy_facul/context/context.dart';
import 'package:easy_facul/otherPages/add_activity.dart';
import 'package:easy_facul/otherPages/add_course.dart';
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
                  "O que você precisa fazer hoje?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
                    SizedBox(width: 8),
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
