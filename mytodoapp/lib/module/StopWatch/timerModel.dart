import 'dart:async';

import 'package:flutter/material.dart';

class TimerModel extends ChangeNotifier {
  int hour = 0;
  int min = 0;
  int sec = 0;

  bool isStopPressed = true;
  bool isStartPressed = true;
  bool checkTimer = false;


  int time = 0;
  String timeToDisplay = "";
  final duration = const Duration(seconds: 1);

  startTimer () {
    isStartPressed = false;
    isStopPressed = true;

    time = (hour * 60 * 60) + (min * 60) + sec;
    Timer.periodic(duration, (Timer t) { 
      if(time < 1 || checkTimer == false) {
        t.cancel();
        timeToDisplay = "";
        isStopPressed = false;
        isStartPressed = true;
        checkTimer = true;
      } else {
        time = time -1;
      }
      timeToDisplay = time.toString();

      notifyListeners();
    });
  }

  stopTimer () {
    isStartPressed = true;
    isStopPressed = false;
  }
}
