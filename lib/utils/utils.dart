import 'dart:developer';

import 'package:flutter/material.dart';

class Utils {
  static void pushReplaceFunction(context, Widget screeen) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (ctx) => screeen,
      ),
    );
  }

  static void pushNameReplaceFunction(context, String screen, {int? argument}) {
    Navigator.pushReplacementNamed(context, screen,
        arguments: {'value': argument});
  }

  static void pushNameFunction(context, String screen) {
    Navigator.pushNamed(context, screen);
  }

  static void pushFunction(context, Widget screeen) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => screeen,
      ),
    );
  }

  static bool statusCodeCheck(int statusCode, void Function() fn) {
    log(statusCode.toString());
    switch (statusCode) {
      case 200 || 201:
        log('case1');
        fn();
        return true;
      case 400:
        log('case2');

        return false;
      case 401:
        log('case3');
        return false;
      default:
        print('default');
        return false;
    }
  }
}
