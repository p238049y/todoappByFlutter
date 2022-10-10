import 'package:flutter/material.dart';
import 'package:mytodoapp/DB/sqflite.dart';
import 'package:mytodoapp/Views/TodoList/TodoAddPage.dart';
import 'package:mytodoapp/module/StopWatch/stopWatchModel.dart';
import 'package:provider/provider.dart';

class StopWatchPage extends StatelessWidget {
  final DisplayData displayData;

  const StopWatchPage({super.key, required this.displayData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30.0),
        child: ChangeNotifierProvider<StopWatchModel>(
            create: (_) => StopWatchModel(),
            child: Consumer<StopWatchModel>(builder: (context, model, child) {
              return Column(
                children: [
                  const SizedBox(height: 20.0),
                  Text(
                    displayData.text,
                    style: const TextStyle(
                        fontSize: 36.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 50.0),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      model.stopWatchTimeDisplay,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 50.0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 70, right: 8),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                            onPrimary: Colors.grey,
                          ),
                          onPressed:
                              model.isStopPressed ? null : model.stopStopWatch,
                          child: const Text(
                            'STOP',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.0),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 8),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            onPrimary: Colors.grey,
                          ),
                          onPressed: model.isResetPressed
                              ? null
                              : model.resetStopWatch,
                          child: const Text(
                            'RESET',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                      onPrimary: Colors.grey,
                    ),
                    onPressed:
                        model.isStartPressed ? model.startStopWatch : null,
                    child: const Text(
                      'START',
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      onPrimary: Colors.grey,
                    ),
                    onPressed:() async {
                      displayData.targetTime = "ストップウォッチを使用したため未設定";
                      displayData.elapsedTime = model.stopWatchTimeDisplay;
                      await DbProvider.insertData(displayData);
                      Navigator.of(context).pop(displayData);
                    },
                    child: const Text(
                      'ADD',
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                  ),
                ],
              );
            })),
      ),
    );
  }
}
