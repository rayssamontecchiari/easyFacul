import 'package:easy_facul/context/context.dart';
import 'package:easy_facul/utils/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddActivity extends StatefulWidget {
  final String idCurrentCourse;

  AddActivity({Key? key, required this.idCurrentCourse}) : super(key: key);

  @override
  State<AddActivity> createState() => _AddActivityState();
}

class _AddActivityState extends State<AddActivity> {
  final TextEditingController _controladorType = TextEditingController();
  final TextEditingController _controladorValue = TextEditingController();
  final TextEditingController _controladorDate = TextEditingController();
  final TextEditingController _controladorContent = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        textTitle: "Adicionar atividade",
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  "Forneça as informações da nova atividade",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: TextField(
                    controller: _controladorType,
                    decoration: const InputDecoration(
                      labelText: "Tipo de avaliação",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: TextField(
                    controller: _controladorValue,
                    decoration: const InputDecoration(labelText: "Valor"),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: TextField(
                    controller: _controladorDate,
                    decoration: const InputDecoration(labelText: "Data"),
                    keyboardType: TextInputType.datetime,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: TextField(
                    controller: _controladorContent,
                    decoration: const InputDecoration(labelText: "Conteúdo"),
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
                          final String type = _controladorType.text;
                          final String value = _controladorValue.text;
                          final String date = _controladorDate.text;
                          final String content = _controladorContent.text;

                          final newActivity = Activity(
                            type: type,
                            value: value,
                            date: date,
                            content: content,
                          );
                          user.addActivityToCourse(
                              widget.idCurrentCourse, newActivity);

                          _controladorType.clear();
                          _controladorValue.clear();
                          _controladorDate.clear();
                          _controladorContent.clear();
                        },
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
