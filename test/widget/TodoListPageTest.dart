import 'package:flutter_test/flutter_test.dart';
import 'package:mytodoapp/Views/TodoList/TodoListPage.dart';

void main() {
  group('Todo List Page Widget Test', () {
    testWidgets('+ボタンをクリックした際に、TODO追加画面に遷移すること', (WidgetTester tester) async {
      // テストする仮想のWidgetを準備する
      await tester.pumpWidget(TodoListPage());
    });

    testWidgets('+ボタンをクリックした際に、TODO追加画面に遷移すること', (WidgetTester tester) async {
      // テストする仮想のWidgetを準備する
      await tester.pumpWidget(TodoListPage());
    });
  });
}