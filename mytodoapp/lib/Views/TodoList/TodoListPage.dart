import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mytodoapp/Views/StopWatch/StopWatchMainPage.dart';
import 'package:mytodoapp/Views/StopWatch/StopWatchPage.dart';
import 'package:mytodoapp/Views/TodoList/TodoAddPage.dart';
import 'package:mytodoapp/Views/TodoList/TodoDetailPage.dart';

// リスト一覧画面用Widget
class TodoListPage extends StatefulWidget {
  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  List<DisplayData> todoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('リスト一覧'),
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
                title: Text(todoList[index].text),
                subtitle: Text(DateFormat('yyyy/MM/dd HH:mm:ss')
                    .format(todoList[index].dateTime)),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => TodoDetailPage(todoList[index])),
                  );
                }),
          );
        },
      ),
      floatingActionButton: Column(
        verticalDirection: VerticalDirection.up, // childrenの先頭を下に配置
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FloatingActionButton(
            heroTag: 'todoAdd',
            backgroundColor: Colors.blue,
            onPressed: () async {
              final newListText = await Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return TodoAddPage();
                }),
              );
              if (newListText != null) {
                setState(() {
                  todoList.add(newListText);
                });
              }
            },
            child: const Icon(Icons.add),
          ),
          Container(
            // 余白のためContainerでラップ
            margin: const EdgeInsets.only(bottom: 16.0),
            child: FloatingActionButton(
              heroTag: 'timerAndStopWatch',
              backgroundColor: Colors.orange,
              child: const Icon(Icons.timer),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return StopWatchMainPage();
                  }),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
