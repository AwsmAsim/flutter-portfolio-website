import 'package:flutter/material.dart';

class DialogUtils {
  static DialogUtils _instance = new DialogUtils.internal();

  DialogUtils.internal();

  factory DialogUtils() => _instance;

  static void showCustomDialog(BuildContext context,
      {required String title,
        String okBtnText = "Ok",
        required void Function() okBtnFunction}) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text(title),
            content: Container(
              height: 70.0,
              width: 70.0,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/sad-emoji.png')
                )
              ),
            ),
            actions: <Widget>[
              TextButton(
                  child: Text(okBtnText),
                  onPressed: () => Navigator.pop(context))
            ],
          );
        });
  }
}