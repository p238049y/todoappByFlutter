import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mytodoapp/Views/TodoList/TodoAddPage.dart';

class TodoDetailPage extends StatefulWidget {
  @override
  _TodoDetailPage createState() => _TodoDetailPage();
}

class _TodoDetailPage extends State<TodoDetailPage> {

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
          children: const <Widget>[
            Text(
              'やること',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 24),
            Text(
              '実施日',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 24),
            Text(
              '詳細内容',
              style: TextStyle(
                fontSize: 20,
              ),              
            ),
            SizedBox(height: 24),
            Text(
              '目標時間',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 24),
            Text(
              '経過時間',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}