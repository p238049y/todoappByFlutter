import 'package:flutter/material.dart';
import 'package:mytodoapp/module/StopWatch/timerModel.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  _TimerPage createState() => _TimerPage();
}

class _TimerPage extends State<TimerPage> with TickerProviderStateMixin {
  int hour = 0;
  int min = 0;
  int sec = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 6,
              child: Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.only(
                          bottom: 10.0,
                        ),
                        child: Text("HH"),
                      ),
                      NumberPicker(
                        minValue: 0,
                        maxValue: 23,
                        value: hour,
                        onChanged: (val) => setState(() => hour = val),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.only(
                          bottom: 10.0,
                        ),
                        child: Text("mm"),
                      ),
                      NumberPicker(
                        minValue: 0,
                        maxValue: 59,
                        value: min,
                        onChanged: (val) => setState(() => min = val),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.only(
                          bottom: 10.0,
                        ),
                        child: Text("ss"),
                      ),
                      NumberPicker(
                        minValue: 0,
                        maxValue: 59,
                        value: sec,
                        onChanged: (val) => setState(() => sec = val),
                      ),
                    ],
                  ),
                ]
              ),
            )
          ]),
        // padding: const EdgeInsets.all(30.0),
        // child: ChangeNotifierProvider<TimerModel>(
        //   create: (_) => TimerModel(),  
        //   child: Consumer<TimerModel>(
        //     builder: (context, model, child) {
        //       return Column(
        //         children: [
        //           const SizedBox(height: 100.0),
        //           Container(
        //             alignment: Alignment.center,
        //             child: Text(
        //               model.timerDisplay,
        //               style: const TextStyle(
        //                 fontWeight: FontWeight.bold,
        //                 fontSize: 50.0,
        //               ),
        //             ),
        //           ),
        //           const SizedBox(height: 30.0),
        //           Row(
        //             children: [
        //               Padding(
        //                 padding: const EdgeInsets.only(left: 70, right: 8),
        //                 child: ElevatedButton(
        //                   style: ElevatedButton.styleFrom(
        //                     primary: Colors.red,
        //                     onPrimary: Colors.grey,
        //                   ),
        //                   onPressed: model.isStopPressed ? null : model.stopStopWatch,
        //                   child: const Text('STOP',
        //                     style: TextStyle(color: Colors.white),
        //                   ),
        //                 ),
        //               ),
        //               Padding(
        //                 padding: const EdgeInsets.only(left: 30, right: 8),
        //                 child: ElevatedButton(
        //                   style: ElevatedButton.styleFrom(
        //                     primary: Colors.green,
        //                     onPrimary: Colors.grey,
        //                   ),
        //                   onPressed: model.isResetPressed ? null : model.resetStopWatch,
        //                   child: const Text('RESET',
        //                     style: TextStyle(color: Colors.white),
        //                   ),
        //                 ),
        //               ),
        //             ],
        //           ),
        //           const SizedBox(height: 20.0),
        //           ElevatedButton(
        //             style: ElevatedButton.styleFrom(
        //               primary: Colors.orange,
        //               onPrimary: Colors.grey,
        //             ),
        //             onPressed: model.isStartPressed ? model.startStopWatch : null,
        //             child: const Text('START',
        //               style: TextStyle(color: Colors.white),
        //             ),
        //           ),
        //         ],
        //       );
        //     }
        //   )
        // ),
      ),
    );
  }
}
