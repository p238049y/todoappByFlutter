import 'package:flutter/material.dart';
import 'package:mytodoapp/module/StopWatch/stopWatchModel.dart';
import 'package:provider/provider.dart';

// class StopWatchPage extends StatelessWidget {
//   @override
//   _StopWatchPage createState() => _StopWatchPage();
// }

class StopWatchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ストップウォッチ'),
      ),
      body: Container(
        padding: const EdgeInsets.all(30.0),
        child: ChangeNotifierProvider<StopWatchModel>(
          create: (_) => StopWatchModel(),
          child: Consumer<StopWatchModel>(
            builder: (context, model, child) {
              return Column(
                children: [
                  const SizedBox(height: 100.0),
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
                        padding: const EdgeInsets.only(left: 50, right: 8),
                        child: RaisedButton(
                          color: Colors.redAccent,
                          onPressed: model.isStopPressed ? null : model.stopStopWatch(),
                          child: const Text('STOP'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 8),
                        child: RaisedButton(
                          color: Colors.green,
                          onPressed: model.isResetPressed ? null : model.resetStopWatch(),
                          child: const Text('RESET'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  RaisedButton(
                    color: Colors.orange,
                    onPressed: model.isStartPressed ? model.startStopWatch : null,
                    child: const Text('START'),
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
