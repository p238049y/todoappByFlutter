import 'package:flutter_test/flutter_test.dart';
import 'package:mytodoapp/module/StopWatch/timerModel.dart';

void main() {
  group('convertDisplayTimeメソッドのテスト', () {
    test('引数のtimeが59秒の場合は00:00:59が返されること', () {
      expect(TimerModel().convertDisplayTime(59), '00:00:59');
    });

    test('引数のtimeが60秒の場合は00:01:00と返されること', () {
      expect(TimerModel().convertDisplayTime(60), '00:01:00');
    });

    test('引数のtimeが3599秒の場合は00:59:59と返されること', () {
      expect(TimerModel().convertDisplayTime(3599), '00:59:59');
    });

    test('引数のtimeが3600秒の場合は01:00:00と返されること', () {
      expect(TimerModel().convertDisplayTime(3600), '01:00:00');
    });
  });
}
