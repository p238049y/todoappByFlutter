// リスト追加画面用Widget
import 'package:flutter/material.dart';
import 'package:mytodoapp/module/TodoList/todoAdd.dart';

import 'widget/ButtonGroupWidget.dart';

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
        padding: const EdgeInsets.all(16),
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
              const SizedBox(height: 16),
              ButtonGroupWidget(
                  displayData: displayData,
                  isTodoNameError: isTodoNameError,
                  isDetailInformationError: isDetailInformationError)
            ]),
      ),
    );
  }
}
