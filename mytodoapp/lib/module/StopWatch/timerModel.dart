import 'dart:async';

import 'package:flutter/material.dart';

class TimerModel extends ChangeNotifier {
  int hour = 0;
  int min = 0;
  int sec = 0;

  bool isStopPressed = true;
  bool isResetPressed = true;
  bool isStartPressed = true;

  String timerDisplay = '99:99:99';
  var stopWatch = Stopwatch();
  final duration = const Duration(seconds: 1);

  startTimer () {
    Timer(duration, keepRunning);
  }

  keepRunning () {
    if (stopWatch.isRunning) {
      startTimer();
    }

    timerDisplay = '${stopWatch.elapsed.inHours.toString().padLeft(2, '0')}:${(stopWatch.elapsed.inMinutes%60).toString().padLeft(2,"0")}:${(stopWatch.elapsed.inSeconds%60).toString().padLeft(2,"0")}';

    notifyListeners();
  }

  startStopWatch() {
    isStopPressed = false;
    isStartPressed = true;
    stopWatch.start();
    startTimer();
    notifyListeners();
  }

  stopStopWatch() {
    isStopPressed = true;
    isResetPressed = false;
    stopWatch.stop();
    notifyListeners();
  }

  resetStopWatch() {
    isResetPressed = true;
    isStartPressed = true;
    stopWatch.reset();
    timerDisplay = '99:99:99';
    notifyListeners();
  }
}
