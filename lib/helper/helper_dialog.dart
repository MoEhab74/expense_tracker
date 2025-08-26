import 'package:flutter/material.dart';

showDialogBox(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      content: SizedBox(
        height: 100,
        width: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(message),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        ),
      ),
    ),
  );
}

void loadingIndicator(BuildContext context, {String message = 'Loading...'}) {
    showDialog(
      context: context,
      // barrierDismissible is set to false to prevent closing the dialog
      // while the login process is ongoing
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        content: SizedBox(
          height: 100,
          width: 200,
          child: Row(
            children: [
              CircularProgressIndicator(),
              SizedBox(width: 16),
              Text(message),
            ],
          ),
        ),
      ),
    );
  }
