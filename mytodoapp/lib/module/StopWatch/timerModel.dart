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
      } else if (time < 60) {
        timeToDisplay = time.toString();
        time = time -1;
      } else if (time < 3600) {
        int m = (time ~/ 60);
        int s = time - (60 * m);
        timeToDisplay = '$m:$s';
        time = time -1;
      }else {
        int h = (time ~/ 3600);
        int t = time - (3600 * h);
        int m = (t ~/ 60);
        int s = t - (60 * m);
        timeToDisplay = '$h:$m:$s';
        time = time -1;
      }
      notifyListeners();
    });
  }

  stopTimer () {
    isStartPressed = true;
    isStopPressed = false;
    checkTimer = false;
  }
}
