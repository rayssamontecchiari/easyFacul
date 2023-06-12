import 'package:easy_facul/context/context.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddCourse extends StatefulWidget {
  AddCourse({Key? key}) : super(key: key);

  @override
  State<AddCourse> createState() => _AddCourseState();
}

class _AddCourseState extends State<AddCourse> {
  final TextEditingController _controladorName = TextEditingController();
  final TextEditingController _controladorClassTime = TextEditingController();
  final TextEditingController _controladorProfessor = TextEditingController();
  final TextEditingController _controladorPeriod = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Adicionar matéria",
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
        backgroundColor: Colors.blue[200],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Text(
                "Forneça as informações da nova disciplina",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextField(
                  controller: _controladorName,
                  decoration: const InputDecoration(labelText: "Nome"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextField(
                  controller: _controladorClassTime,
                  decoration:
                      const InputDecoration(labelText: "Horário das aulas"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextField(
                  controller: _controladorProfessor,
                  decoration:
                      const InputDecoration(labelText: "Nome do professor"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: TextField(
                  controller: _controladorPeriod,
                  decoration: const InputDecoration(labelText: "Periodo"),
                ),
              ),
              Consumer<User>(
                builder: (context, dataProvider, _) {
                  final user = Provider.of<User>(context, listen: false);

                  return Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        child: Text('Adicionar'),
                        onPressed: () {
                          final String name = _controladorName.text;
                          final String classTime = _controladorClassTime.text;
                          final String professor = _controladorProfessor.text;
                          final String period = _controladorPeriod.text;

                          final newCourse = Course(
                            name: name,
                            classTime: classTime,
                            professor: professor,
                            period: period,
                            activities: [],
                          );
                          user.addCourse(newCourse);

                          _controladorName.clear();
                          _controladorClassTime.clear();
                          _controladorPeriod.clear();
                          _controladorProfessor.clear();
                        },
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                        ),
                      ));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
