import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:mytodoapp/DB/sqflite.dart';
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
  List<DisplayData> displayDataList = [];

  Future<void> initDb() async {
    await DbProvider.setDb();
    displayDataList = await DbProvider.getDisplayData();
    setState(() {});
  }

  Future<void> reBuild() async {
    displayDataList = await DbProvider.getDisplayData();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    initDb();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('リスト一覧'),
      ),
      body: FutureBuilder(
        future: reBuild(),
        builder: (context, snapshot) {
          return Scrollbar(
            child: ListView.builder(
              itemCount: displayDataList.length,
              itemBuilder: (context, index) {
                return Card(
                    child: Slidable(
                  endActionPane: ActionPane(
                    motion: DrawerMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (value) {
                          print('削除');
                        },
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: '削除',
                      ),
                    ],
                  ),
                  child: ListTile(
                      title: Text(displayDataList[index].text),
                      subtitle: Text(DateFormat('yyyy/MM/dd HH:mm:ss')
                          .format(displayDataList[index].dateTime)),
                      onTap: () async {
                        await Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) =>
                                  TodoDetailPage(displayDataList[index])),
                        );
                      }),
                ));
              },
            ),
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
              setState(() {
                displayDataList.add(newListText);
              });
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
