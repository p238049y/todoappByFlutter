import 'package:flutter/material.dart';
import 'package:mytodoapp/module/StopWatch/timerModel.dart';
import 'package:provider/provider.dart';

class TimerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30.0),
        child: ChangeNotifierProvider<TimerModel>(
          create: (_) => TimerModel(),  
          child: Consumer<TimerModel>(
            builder: (context, model, child) {
              return Column(
                children: [
                  const SizedBox(height: 100.0),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      model.timerDisplay,
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
                          onPressed: model.isStopPressed ? null : model.stopStopWatch,
                          child: const Text('STOP',
                            style: TextStyle(color: Colors.white),
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
                          onPressed: model.isResetPressed ? null : model.resetStopWatch,
                          child: const Text('RESET',
                            style: TextStyle(color: Colors.white),
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
                    onPressed: model.isStartPressed ? model.startStopWatch : null,
                    child: const Text('START',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              );
            }
          )
        ),
      ),
    );
  }
}
