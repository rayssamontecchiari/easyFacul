import 'package:easy_facul/context/context.dart';
import 'package:easy_facul/utils/app_bar.dart';
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

  final _formKey = GlobalKey<FormState>();

  bool checkClassTime(String string) {
    RegExp padrao = RegExp(r'^(\w{3}\s([MT]\d\s?)+\s-\s)+\w{3}\s([MT]\d\s?)+$');
    return padrao.hasMatch(string);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBarCustom(
          textTitle: "Adicionar matéria",
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.amber[200],
                border: Border.all(
                  color: Colors.amber,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SingleChildScrollView(
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
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        controller: _controladorName,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Nome",
                          fillColor: Colors.white70,
                          filled: true,
                        ),
                        validator: (String? value) {
                          if (value != null && value.isEmpty) {
                            return "insira o nome!";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: TextFormField(
                        controller: _controladorClassTime,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Horário da aula",
                          fillColor: Colors.white70,
                          filled: true,
                        ),
                        validator: (String? value) {
                          if (value!.isEmpty || !checkClassTime(value)) {
                            return "insira o dia e horário da aula!";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: TextFormField(
                        controller: _controladorProfessor,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Professor",
                          fillColor: Colors.white70,
                          filled: true,
                        ),
                        validator: (String? value) {
                          if (value != null && value.isEmpty) {
                            return "insira o nome do professor!";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: TextFormField(
                        controller: _controladorPeriod,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Periodo",
                          fillColor: Colors.white70,
                          filled: true,
                        ),
                        validator: (String? value) {
                          if (value!.isEmpty ||
                              int.parse(value) < 1 ||
                              int.parse(value) > 10) {
                            return "insira o periodo (entre 1 e 10)!";
                          }
                          return null;
                        },
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
                              if (_formKey.currentState!.validate()) {
                                final String name = _controladorName.text;
                                final String classTime =
                                    _controladorClassTime.text;
                                final String professor =
                                    _controladorProfessor.text;
                                final String period = _controladorPeriod.text;

                                final newCourse = Course(
                                  name: name,
                                  classTime: classTime,
                                  professor: professor,
                                  period: period,
                                  activities: [],
                                );
                                user.addCourse(newCourse);

                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Adicionando disciplina"),
                                    backgroundColor: Colors.blue,
                                  ),
                                );

                                Navigator.pop(context);
                              }
                            },
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero,
                                  ),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.amber),
                                shadowColor: MaterialStateProperty.all<Color>(
                                    Colors.transparent),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white)),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
