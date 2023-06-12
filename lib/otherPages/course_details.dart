import 'package:easy_facul/context/context.dart';
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
      body: const SafeArea(
        child: Column(
          children: [Text("hey")],
        ),
      ),
    );
  }
}
