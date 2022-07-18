import 'package:flutter/material.dart';
import 'package:mytodoapp/Views/StopWatch/StopWatchPage.dart';
import 'package:mytodoapp/Views/TodoList/TodoAddPage.dart';

class StopWatchMainPage extends StatelessWidget {
  final _tab = <Tab> [
    const Tab(text: 'タイマー', icon: Icon(Icons.av_timer)),
    const Tab(text: 'ストップウォッチ', icon: Icon(Icons.timer)),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tab.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Tab Page"),
          bottom: TabBar(
            tabs: _tab,
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            TodoAddPage(),
            StopWatchPage(),
          ],
        ),
      )
    );
  }
}