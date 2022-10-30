import 'package:flutter/material.dart';
import 'package:mytodoapp/DB/sqflite.dart';
import 'package:mytodoapp/Views/TodoList/TodoAddPage.dart';
import 'package:mytodoapp/module/StopWatch/timerModel.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';

class TimerPage extends StatefulWidget {
  final DisplayData displayData;
  const TimerPage({Key? key, required this.displayData}) : super(key: key);

  @override
  _TimerPage createState() => _TimerPage();
}

class _TimerPage extends State<TimerPage> with TickerProviderStateMixin {
  late DisplayData displayData;
  bool isDisplayTimerWidget = false;

  Future<void> initDb() async {
    await DbProvider.setDb();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    initDb();
    // 受け取ったデータを状態を管理する変数に格納
    displayData = widget.displayData;
  }

  void switchTimerWidget() {
    setState(() {
      isDisplayTimerWidget = !isDisplayTimerWidget;
    });
  }

  Widget createTimerWidget(bool value, TimerModel model) {
    if (value) {
      return Center(
        child: Stack(
          children: [
            const Center(
              child: SizedBox(
                height: 300,
                width: 300,
                child: CircularProgressIndicator(value: 1, strokeWidth: 10),
              ),
            ),
            Center(
              child: Text(
              model.timeToDisplay,
              style: const TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            ),
          ],
        ),
      );
    } else {
      return Expanded(
        flex: 6,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(
                  bottom: 10.0,
                ),
                child: Text(
                  "Hour",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ),
              NumberPicker(
                minValue: 0,
                maxValue: 23,
                value: model.hour,
                onChanged: (val) => model.changeHourVal(val),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(
                  bottom: 10.0,
                ),
                child: Text(
                  "Min",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ),
              NumberPicker(
                minValue: 0,
                maxValue: 59,
                value: model.min,
                onChanged: (val) => model.changeMinuteVal(val),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(
                  bottom: 10.0,
                ),
                child: Text(
                  "Sec",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ),
              NumberPicker(
                minValue: 0,
                maxValue: 59,
                value: model.sec,
                onChanged: (val) => model.changeSecondVal(val),
              ),
            ],
          ),
        ]),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ChangeNotifierProvider<TimerModel>(
      create: (_) => TimerModel(),
      child: Consumer<TimerModel>(builder: (context, model, child) {
        return Column(mainAxisAlignment: MainAxisAlignment.center, children: <
            Widget>[
          const SizedBox(height: 50.0),
          Text(
            displayData.text,
            style: const TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24.0),
          // タイマー設定部分
          createTimerWidget(isDisplayTimerWidget, model),
          // ボタン群のコード
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                    onPrimary: Colors.grey,
                  ),
                  onPressed: () {
                    model.isStartPressed ? model.startTimer : null;
                    switchTimerWidget();
                  },
                  child: const Text(
                    'START',
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    onPrimary: Colors.grey,
                  ),
                  onPressed: model.isStopPressed ? model.stopTimer : null,
                  child: const Text(
                    'STOP',
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    onPrimary: Colors.grey,
                  ),
                  onPressed: () async {
                    displayData.targetTime = model.initialSettingTimeToDisplay;
                    displayData.elapsedTime = model.elapsedTimeToDisplay;
                    await DbProvider.insertData(displayData);
                    Navigator.of(context).pop(displayData);
                  },
                  child: const Text(
                    'ADD',
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                ),
              ],
            ),
          )
        ]);
      }),
    ));
  }
}
