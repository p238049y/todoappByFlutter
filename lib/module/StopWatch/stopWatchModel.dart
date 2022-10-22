import 'dart:async';

import 'package:flutter/material.dart';

class StopWatchModel extends ChangeNotifier {
  bool isStopPressed = true;
  bool isResetPressed = true;
  bool isStartPressed = true;

  String stopWatchTimeDisplay = '00:00:00';
  var stopWatch = Stopwatch();
  final duration = const Duration(seconds: 1);

  startTimer() {
    Timer(duration, keepRunning);
    isStartPressed = false;
  }

  keepRunning() {
    if (stopWatch.isRunning) {
      startTimer();
    }

    stopWatchTimeDisplay =
        '${stopWatch.elapsed.inHours.toString().padLeft(2, '0')}:${(stopWatch.elapsed.inMinutes % 60).toString().padLeft(2, "0")}:${(stopWatch.elapsed.inSeconds % 60).toString().padLeft(2, "0")}';

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
    stopWatchTimeDisplay = '00:00:00';
    notifyListeners();
  }
}
