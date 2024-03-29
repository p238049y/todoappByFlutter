// リスト追加画面用Widget
import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:intl/intl.dart';
import 'package:mytodoapp/Views/StopWatch/StopWatchMainPage.dart';
import 'package:mytodoapp/module/TodoList/todoAdd.dart';

class TodoAddPage extends StatefulWidget {
  @override
  _TodoAddPageState createState() => _TodoAddPageState();
}

class DisplayData {
  int id;
  String text;
  String detailInformation = '';
  DateTime dateTime = DateTime.utc(0, 0, 0);
  String? elapsedTime;
  String? targetTime;

  DisplayData({
    this.id = 0,
    required this.text,
    required this.detailInformation,
    required this.dateTime,
    this.elapsedTime = '',
    this.targetTime = '',
  });
}

class _TodoAddPageState extends State<TodoAddPage> {
  // 入力されたテキストをデータとして持つ
  String _text = '';
  String _detailInformation = '';
  DateTime? _datetime;

  DisplayData displayData = DisplayData(
      dateTime: DateTime.utc(0, 0, 0), detailInformation: '', text: '');

  bool isTodoNameError = false;
  bool isDetailInformationError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('タスク追加'),
      ),
      body: Container(
        padding: const EdgeInsets.all(50),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'やること',
                      labelStyle: TextStyle(
                        fontSize: 20,
                      ),
                      border: OutlineInputBorder()),
                  onChanged: (String value) {
                    setState(() {
                      displayData.text = value;
                    });
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (inputValidation(value!, 30) != null) {
                      isTodoNameError = true;
                    } else {
                      isTodoNameError = false;
                    }

                    return inputValidation(value, 30);
                  }),
              const SizedBox(height: 24),
              TextFormField(
                  decoration: const InputDecoration(
                    labelText: '詳細内容',
                    labelStyle: TextStyle(
                      fontSize: 20,
                    ),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: 20,
                  onChanged: (String value) {
                    setState(() {
                      displayData.detailInformation = value;
                    });
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (inputValidation(value!, 256) != null) {
                      isDetailInformationError = true;
                    } else {
                      isDetailInformationError = false;
                    }

                    return inputValidation(value, 256);
                  }),
              const SizedBox(height: 24),
              buttonGroupWidget(
                  displayData, isTodoNameError, isDetailInformationError)
            ]),
      ),
    );
  }

  Widget buttonGroupWidget(DisplayData displayData, bool isTodoNameError,
      bool isDetailInformationError) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 4),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
              onPrimary: Colors.grey,
            ),
            onPressed: () {
              displayData.dateTime = DateTime.now();
              if (displayData.text.isEmpty || isTodoNameError || isDetailInformationError) {
                return;
              } else {
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
              primary: Colors.green,
              onPrimary: Colors.grey,
            ),
            onPressed: () {
              displayData.dateTime = DateTime.now();
              if (displayData.text.isEmpty || isTodoNameError || isDetailInformationError) {
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
    );
  }
}
