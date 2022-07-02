// リスト追加画面用Widget
import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';

class TodoAddPage extends StatefulWidget {
  @override
  _TodoAddPageState createState() => _TodoAddPageState();
}
class DisplayData {
  String text = '';
  DateTime? dateTime;
}

class _TodoAddPageState extends State<TodoAddPage> {
  // 入力されたテキストをデータとして持つ
  String _text = '';
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
            TextField(
              onChanged: (String value) {
                setState(() {
                  _text = value;
                });
              }
            ),
            TextButton(
              child: const Text('時間入力', style: TextStyle(decoration: TextDecoration.underline)), 
              onPressed: () async {
                Picker(
                  adapter: DateTimePickerAdapter(type: PickerDateTimeType.kHMS, value: _datetime, customColumnType: [3, 4, 5]),
                  title: const Text('Select Time'),
                  onConfirm: (Picker picker, List value) {
                    setState(()  => {
                      _datetime = DateTime.utc(0, 0, 0, value[0], value[1], value[2])
                    });
                  }
                ).showModal(context);
              },
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(_text);
                },
                child: const Text('リスト追加', style: TextStyle(color: Colors.white)),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                }, 
                child: const Text('キャンセル'),
              ),
            ),
          ]
        ),
      ),
    );
  }
}