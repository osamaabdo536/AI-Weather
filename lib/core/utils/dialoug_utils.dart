import 'package:flutter/material.dart';
import 'constants.dart';

class DialogUtils {
  static void showLoading(BuildContext context, String message) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: primaryColor,
          content: Row(
            children: [
              const CircularProgressIndicator(
                color: Colors.white,
              ),
              const SizedBox(
                width: 12,
              ),
              Text(
                message,
                style: const TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static void hideLoading(BuildContext context) {
    Navigator.pop(context);
  }

  static void showMessage(
      BuildContext context,
      String message, {
        String title = 'Title',
        String? posActionName,
        VoidCallback? posAction,
        String? negActionName,
        VoidCallback? negAction,
        bool isDismissible = false,
      }) {
    List<Widget> actions = [];
    if (posActionName != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            posAction?.call();
          },
          child: Text(
            posActionName,
            style: const TextStyle(color: Colors.white),
          )));
    }
    if (negActionName != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            negAction?.call();
          },
          child: Text(negActionName)));
    }
    showDialog(
        barrierDismissible: isDismissible,
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: primaryColor,
            title: Text(title),
            content: Text(
              message,
              style: const TextStyle(
                fontSize: 22,
                color: Colors.white,
              ),
            ),
            actions: actions,
            titleTextStyle: const TextStyle(
              fontSize: 22,
              color: Colors.white,
            ),
          );
        });
  }
}
