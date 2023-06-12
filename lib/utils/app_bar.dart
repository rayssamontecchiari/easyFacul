import 'package:flutter/material.dart';

class AppBarCustom extends AppBar {
  final String textTitle;

  AppBarCustom({super.key, required this.textTitle})
      : super(
          leading: Builder(builder: (context) {
            return InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            );
          }),
          backgroundColor: Colors.blue[200],
          title: Text(
            textTitle,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        );
}
