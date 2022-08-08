import 'dart:async';

import 'package:flutter/material.dart';

class TimerModel extends ChangeNotifier {
  int hour = 0;
  int min = 0;
  int sec = 0;

  bool isStopPressed = true;
  bool isStartPressed = true;
  bool checkTimer = true;

  int time = 0;
  String timeToDisplay = "";
  final duration = const Duration(seconds: 1);

  startTimer() {
    isStartPressed = false;
    isStopPressed = true;

    time = (hour * 60 * 60) + (min * 60) + sec;
    Timer.periodic(duration, (Timer t) {
      if (time < 1 || checkTimer == false) {
        t.cancel();
        timeToDisplay = 'Finish!!!';
        isStopPressed = false;
        isStartPressed = true;
        checkTimer = true;
      } else if (time < 60) {
        int h = 0;
        int m = 0;
        timeToDisplay =
            '${h.toString().padLeft(2, '0')}:${m.toString().padLeft(2, '0')}:${time.toString().padLeft(2, '0')}';
        time = time - 1;
      } else if (time < 3600) {
        int m = (time ~/ 60);
        int s = time - (60 * m);
        timeToDisplay =
            '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
        time = time - 1;
      } else {
        int h = (time ~/ 3600);
        int t = time - (3600 * h);
        int m = (t ~/ 60);
        int s = t - (60 * m);
        timeToDisplay =
            '${h.toString().padLeft(2, '0')}:${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
        time = time - 1;
      }
      notifyListeners();
    });
  }

  stopTimer() {
    isStartPressed = true;
    isStopPressed = false;
    checkTimer = false;
  }

  changeHourVal(val) {
    hour = val;
    if (timeToDisplay == 'Finish!!!') {
      timeToDisplay = '';
    }
    notifyListeners();
  }

  changeMinuteVal(val) {
    min = val;
    if (timeToDisplay == 'Finish!!!') {
      timeToDisplay = '';
    }
    notifyListeners();
  }

  changeSecondVal(val) {
    sec = val;
    if (timeToDisplay == 'Finish!!!') {
      timeToDisplay = '';
    }
    notifyListeners();
  }
}
