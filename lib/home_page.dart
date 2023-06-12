import 'package:easy_facul/context/context.dart';
import 'package:easy_facul/otherPages/courses/add_course.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'otherPages/courses/view_courses.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<User>(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 2 - 32,
                  decoration: BoxDecoration(
                    color: Colors.blue[200],
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.blue,
                      width: 2,
                    ),
                  ),
                  child: const Center(
                      child: Text("aqui deve entrar o calendário")),
                ),
              ),
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
                        height: MediaQuery.of(context).size.height / 4 - 32,
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
                  const SizedBox(width: 8),
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
                        height: MediaQuery.of(context).size.height / 4 - 32,
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
              ),
              SizedBox(height: 8),
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
                          color: Colors.green[300],
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Colors.green,
                            width: 2,
                          ),
                        ),
                        height: MediaQuery.of(context).size.height / 4 - 32,
                        child: const Center(
                          child: Text(
                            "VER CALENDÁRIO DO PERÍODO",
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
                      onTap: () =>
                          {showConfirmationDialog(context, dataProvider)},
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.red[300],
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Colors.red,
                            width: 2,
                          ),
                        ),
                        height: MediaQuery.of(context).size.height / 4 - 32,
                        child: const Center(
                          child: Text(
                            "RESETAR CURSOS",
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

  void showConfirmationDialog(BuildContext context, dataProvider) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmação'),
          content: Text(
              'Você tem certeza de que deseja excluir todos os cursos e atividades cadastradas?'),
          actions: [
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context)
                    .pop(false); // Retorna false se o usuário cancelar
              },
            ),
            TextButton(
              child: Text('Confirmar'),
              onPressed: () {
                Navigator.of(context)
                    .pop(true); // Retorna true se o usuário confirmar
              },
            ),
          ],
        );
      },
    ).then((confirmed) {
      if (confirmed != null && confirmed) {
        dataProvider.removeAllCourses();
      }
    });
  }
}
