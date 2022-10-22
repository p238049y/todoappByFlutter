import 'dart:async';

import 'package:flutter/material.dart';

class TimerModel extends ChangeNotifier {
  int hour = 0;
  int min = 0;
  int sec = 0;

  bool isStopPressed = false;
  bool isStartPressed = true;
  bool checkTimer = true;

  int timeSec = 0;
  int initialSettingTime = 0;
  int elapsedTime = 0;
  String timeToDisplay = '';
  String initialSettingTimeToDisplay = '';
  String elapsedTimeToDisplay = '';
  final duration = const Duration(seconds: 1);

  startTimer() {
    isStartPressed = false;
    isStopPressed = true;

    if (timeSec == 0) {
      timeSec = (hour * 60 * 60) + (min * 60) + sec;
      initialSettingTime = timeSec;
      initialSettingTimeToDisplay = convertDisplayTime(timeSec);
    }

    Timer.periodic(duration, (Timer t) {
      if (!checkTimer) {
        t.cancel();
        elapsedTime = initialSettingTime - timeSec;
        elapsedTimeToDisplay = convertDisplayTime(elapsedTime);
        isStopPressed = false;
        isStartPressed = true;
        checkTimer = true;
      }
      
      if (timeSec < 1) {
        t.cancel();
        timeToDisplay = 'Finish!!!';
        elapsedTime = initialSettingTime;
        elapsedTimeToDisplay = convertDisplayTime(elapsedTime);
        isStopPressed = false;
        isStartPressed = false;
        checkTimer = true;
      } else {
        timeToDisplay = convertDisplayTime(timeSec);
        timeSec = timeSec - 1;
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

  convertDisplayTime(int timeSec) {
    int hour = 0;
    int minute = 0;
    int seconds = 0;
    if (timeSec < 60) {
      return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}:${timeSec.toString().padLeft(2, '0')}';
    } else if (timeSec < 3600) {
      minute = (timeSec ~/ 60);
      seconds = timeSec - (60 * minute);
      return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    } else {
      hour = (timeSec ~/ 3600);
      timeSec = timeSec - (3600 * hour);
      minute = (timeSec ~/ 60);
      seconds = timeSec - (60 * minute);
      return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    }
  }
}
