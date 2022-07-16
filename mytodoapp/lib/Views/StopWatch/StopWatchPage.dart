import 'package:flutter/material.dart';
import 'package:mytodoapp/module/StopWatch/stopWatchModel.dart';

// class StopWatchPage extends StatelessWidget {
//   @override
//   _StopWatchPage createState() => _StopWatchPage();
// }

class StopWatchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ストップウォッチ'),
      ),
      body: Container(
        padding: const EdgeInsets.all(30.0),
      ),
    );
  }
}