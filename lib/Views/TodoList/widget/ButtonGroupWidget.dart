import 'package:flutter/material.dart';
import 'package:mytodoapp/DB/sqflite.dart';
import 'package:mytodoapp/Views/StopWatch/StopWatchMainPage.dart';

import '../TodoAddPage.dart';

class ButtonGroupWidget extends StatelessWidget {
  final DisplayData displayData;
  final bool isTodoNameError;
  final bool isDetailInformationError;

  const ButtonGroupWidget({
    Key? key,
    required this.displayData,
    required this.isTodoNameError,
    required this.isDetailInformationError,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal, // 横スクロール可能に
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 4),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.grey,
                ),
                onPressed: () async {
                  displayData.dateTime = DateTime.now();
                  if (displayData.text.isEmpty ||
                      isTodoNameError ||
                      isDetailInformationError) {
                    return;
                  } else {
                    await DbProvider.insertData(displayData);
                    Navigator.of(context).pop(displayData);
                  }
                },
                child: const Text(
                  'リストへ追加',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4, right: 8),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.grey,
                ),
                onPressed: () {
                  displayData.dateTime = DateTime.now();
                  if (displayData.text.isEmpty ||
                      isTodoNameError ||
                      isDetailInformationError) {
                    return;
                  } else {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                StopWatchMainPage(displayData: displayData)));
                  }
                },
                child: const Text(
                  '時間計測へ',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ),
            ),
          ],
        ));
  }
}
