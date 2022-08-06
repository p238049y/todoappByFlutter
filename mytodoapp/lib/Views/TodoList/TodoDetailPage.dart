import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mytodoapp/Views/TodoList/TodoAddPage.dart';

class TodoDetailPage extends StatefulWidget {
  TodoDetailPage(this.displayData);
  final DisplayData displayData;

  @override
  _TodoDetailPage createState() => _TodoDetailPage(displayData);
}

class _TodoDetailPage extends State<TodoDetailPage> {
  _TodoDetailPage(this.displayData);
  final DisplayData displayData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('やること詳細'),
      ),
      body: Container(
        padding: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        const Expanded(
                          flex: 2,
                          child: Text(
                            'やること',
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ),
                        Expanded(
                           flex: 4,
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(displayData.text, style: const TextStyle(fontSize: 18.0)),
                          )
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Expanded(
                          flex: 2,
                          child: Text(
                            '実施日',
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ),
                        Expanded(
                           flex: 4,
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(DateFormat('yyyy/MM/dd').format(displayData.dateTime), style: const TextStyle(fontSize: 18.0),),
                          )
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Expanded(
                          flex: 2,
                          child: Text(
                            '詳細内容',
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ),
                        Expanded(
                           flex: 4,
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(displayData.detailInformation, style: const TextStyle(fontSize: 18.0),),
                          )
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Expanded(
                          flex: 2,
                          child: Text(
                            '目標時間',
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ),
                        Expanded(
                           flex: 4,
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            child: const Text('目標時間', style: TextStyle(fontSize: 18.0),),
                          )
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Expanded(
                          flex: 2,
                          child: Text(
                            '経過時間',
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ),
                        Expanded(
                           flex: 4,
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            child: const Text('経過時間', style: TextStyle(fontSize: 18.0),),
                          )
                        ),
                      ],
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}