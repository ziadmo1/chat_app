

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

showMessage(BuildContext context,
    {required DialogType dialogType,
    required String desc,
      VoidCallback? btnOkOnPress,
    }) {
  AwesomeDialog(
      context: context,
      animType: AnimType.SCALE,
      dialogType: dialogType,
      title: 'Chat Now',
      desc: desc,
      btnOkOnPress:btnOkOnPress,
      descTextStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
        color: Colors.black
      ),
      titleTextStyle: Theme.of(context).textTheme.bodyLarge,
      btnOkColor: Theme.of(context).primaryColor,
      dialogBackgroundColor: Colors.white
  )
    ..show();
}

void showLoading(BuildContext context, String message,
    {bool isCancelable = true}) {
  showDialog(
      context: context,
      builder: (builder) {
        return AlertDialog(
          backgroundColor: Colors.white,
          content: Row(
            children: [
              CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
              SizedBox(
                width: 12,
              ),
              Text(
                message,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold
                ),
              )
            ],
          ),
        );
      },
      barrierDismissible: isCancelable);
}

void hideLoading(BuildContext context) {
  Navigator.pop(context);
}
