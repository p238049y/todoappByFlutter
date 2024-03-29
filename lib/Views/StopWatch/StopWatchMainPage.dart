import 'package:flutter/material.dart';
import 'package:mytodoapp/Views/StopWatch/StopWatchPage.dart';
import 'package:mytodoapp/Views/StopWatch/TimerPage.dart';
import 'package:mytodoapp/Views/TodoList/TodoAddPage.dart';

class StopWatchMainPage extends StatelessWidget {
  final _tab = <Tab>[
    const Tab(icon: Icon(Icons.av_timer), height: 40),
    const Tab( icon: Icon(Icons.timer), height: 40),
  ];
  final DisplayData displayData;

  StopWatchMainPage({Key? key, required this.displayData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _tab.length,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("時間管理"),
            bottom: TabBar(
              tabs: _tab,              
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              TimerPage(displayData: displayData),
              StopWatchPage(displayData: displayData),
            ],
          ),
        ));
  }
}
