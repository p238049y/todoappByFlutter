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
  String timeToDisplay = '';
  String initialSettingTime = '';
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
      } else {
        timeToDisplay = convertDisplayTime(time);
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

  convertDisplayTime(int time) {
    int hour = 0;
    int minute = 0;
    int seconds = 0;
    if (time < 60) {
      return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}:${time.toString().padLeft(2, '0')}';
    } else if (time < 3600) {
      minute = (time ~/ 60);
      seconds = time - (60 * minute);
      return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    } else {
      hour = (time ~/ 3600);
      time = time - (3600 * hour);
      minute = (time ~/ 60);
      seconds = time - (60 * minute);
      return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    }
  }
}
