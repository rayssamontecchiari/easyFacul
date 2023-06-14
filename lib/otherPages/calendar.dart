import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';

import '../utils/app_bar.dart';

class AcademicCalendar extends StatelessWidget {
  const AcademicCalendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        textTitle: "Calendário Academico",
      ),
      body: SafeArea(
        child: Container(
          child: Container(),
        ),
      ),
    );
  }
}
