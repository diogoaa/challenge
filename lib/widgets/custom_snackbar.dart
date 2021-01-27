import 'package:flutter/material.dart';

class CustomSnackbar {
  static showError(
      String text, GlobalKey<ScaffoldState> scaffoldKey, BuildContext context,
      {int seconds = 2}) {
    return scaffoldKey.currentState.showSnackBar(
      SnackBar(
        backgroundColor: Colors.black.withOpacity(0.5),
        content: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
        duration: Duration(seconds: seconds),
      ),
    );
  }

  static showSuccess(String text, GlobalKey<ScaffoldState> scaffoldKey, context,
      {int seconds = 2}) {
    return scaffoldKey.currentState.showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        content: Text(
          text,
        ),
        duration: Duration(seconds: seconds),
      ),
    );
  }

  static showAlert(
      String text, GlobalKey<ScaffoldState> scaffoldKey, BuildContext context,
      {int seconds = 2}) {
    return scaffoldKey.currentState.showSnackBar(
      SnackBar(
        backgroundColor: Colors.yellow,
        content: Text(
          text,
          style: TextStyle(color: Colors.black87),
        ),
        duration: Duration(seconds: seconds),
      ),
    );
  }
}
