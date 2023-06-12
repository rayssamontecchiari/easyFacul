import 'package:easy_facul/context/context.dart';
import 'package:easy_facul/otherPages/courses/course_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/app_bar.dart';

class viewActivities extends StatefulWidget {
  final String idCurrentCourse;

  viewActivities({Key? key, required this.idCurrentCourse}) : super(key: key);

  @override
  _viewActivitiesState createState() => _viewActivitiesState();
}

class _viewActivitiesState extends State<viewActivities> {
  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<User>(context);
    final _activitiesList =
        dataProvider.getActivitiesFromCourse(widget.idCurrentCourse);

    return Scaffold(
      appBar: AppBarCustom(
        textTitle: "Atividades do curso",
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _activitiesList.length,
                itemBuilder: (BuildContext context, int index) {
                  var item = _activitiesList[index];
                  String dateOfActivity = item.date;
                  String valueOfActivity = item.value;
                  String contentOfActivity = item.content;

                  return Padding(
                    padding: const EdgeInsets.only(
                      top: 16,
                      left: 16,
                      bottom: 0,
                      right: 16,
                    ),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                      child: Column(
                        children: [
                          Text(
                            item.type.toUpperCase(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16, bottom: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Data: $dateOfActivity"),
                                Text("Valor: $valueOfActivity")
                              ],
                            ),
                          ),
                          Container(
                            // width: double.infinity,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Conteúdo: ",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Expanded(child: Text(contentOfActivity)),
                              ],
                            ),
                          ),
                        ],
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
