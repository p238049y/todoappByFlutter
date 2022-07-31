// リスト追加画面用Widget
import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:intl/intl.dart';

class TodoAddPage extends StatefulWidget {
  @override
  _TodoAddPageState createState() => _TodoAddPageState();
}
class DisplayData {
  String text = '';
  String detailInformation = '';
  DateTime dateTime = DateTime.utc(0, 0, 0);
}

class _TodoAddPageState extends State<TodoAddPage> {
  // 入力されたテキストをデータとして持つ
  String _text = '';
  String _detailInformation = '';
  DateTime? _datetime;

  DisplayData displayData = DisplayData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('リスト追加'),
      ),
      body: Container(
        padding: const EdgeInsets.all(64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('今からやること', textAlign: TextAlign.left),
            TextFormField(
              onChanged: (String value) {
                setState(() {
                  displayData.text = value;
                });
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value!.contains(' ') && value.trim() == '') {
                  return '空文字は受け付けていません。';
                }

                if (value.contains('　') && value.trim() == '') {
                  return '空文字は受け付けていません。';
                }

                if (value.length > 30) {
                  return '30文字以下にしてください';
                }
                return null;
              }
            ),
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
                if (value!.contains(' ') && value.trim() == '') {
                  return '空文字は受け付けていません。';
                }

                if (value.contains('　') && value.trim() == '') {
                  return '空文字は受け付けていません。';
                }
                return null;
              }
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (displayData.text.isEmpty) {
                    return;
                  } else {
                    Navigator.of(context).pop(displayData);
                  }
                },
                child: const Text('リスト追加', style: TextStyle(color: Colors.white)),
              ),
            ),
          ]
        ),
      ),
    );
  }
}