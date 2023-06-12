import 'package:easy_facul/otherPages/add_course.dart';
import 'package:easy_facul/otherPages/view_courses.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => AddCourse(),
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
                            "ADICIONAR DISCIPLINAS",
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
                            builder: (_) => viewCourse(),
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
                            "VISUALIZAR DISCIPLINAS",
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
