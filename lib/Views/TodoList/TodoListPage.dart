import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:mytodoapp/DB/sqflite.dart';
import 'package:mytodoapp/Views/TodoList/TodoAddPage.dart';
import 'package:mytodoapp/Views/TodoList/TodoDetailPage.dart';

// リスト一覧画面用Widget
class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

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
                    extentRatio: 0.25,
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (value) async {
                          await DbProvider.deleteData(
                              displayDataList[index].id);
                          reBuild();
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
                      tileColor: Colors.white60,
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
            shape: const CircleBorder(),
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
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
