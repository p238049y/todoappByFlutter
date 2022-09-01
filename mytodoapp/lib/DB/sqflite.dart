import 'package:mytodoapp/Views/TodoList/TodoAddPage.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DbProvider {
  static Database? database;
  static const String tableName = 'todo';

  static Future<void> _createTable(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $tableName(id INTEGER PRIMARY KEY AUTOINCREMENT, todo_title TEXT, detail_information TEXT, elapsed_time TEXT, target_time TEXT , created_at Text);');
  }

  static Future<Database> initDb() async {
    String path = join(await getDatabasesPath(), 'todo.db');
    return await openDatabase(path, version: 1, onCreate: _createTable);
  }

  static Future<Database?> setDb() async {
    if (database == null) {
      database = await initDb();
      return database;
    } else {
      return database;
    }
  }

  static Future<void> insertData(DisplayData displayData) async {
    await database!.insert(tableName, {
      'todo_title': displayData.text,
      'detail_information': displayData.detailInformation,
      'elapsed_time': displayData.elapsedTime,
      'target_time': displayData.targetTime,
      'created_at': displayData.dateTime.toString()
    });
  }

  static Future<List<DisplayData>> getDisplayData() async {
    final List<Map<String, dynamic>> maps = await database!.query(tableName);

    if (maps.isEmpty) {
      return [];
    } else {
      List<DisplayData> displayDataList = List.generate(
          maps.length,
          (index) => DisplayData(
                id: maps[index]['id'],
                text: maps[index]['todo_title'],
                detailInformation: maps[index]['detail_information'],
                elapsedTime: maps[index]['elapsed_time'],
                targetTime: maps[index]['target_time'],
                dateTime: DateTime.parse(maps[index]['created_at']),
              ));
      return displayDataList;
    }
  }

  static Future<void> updateData(DisplayData displayData) async {
    await database!.update(tableName, {
      'todo_title': displayData.text,
      'detail_information': displayData.detailInformation,
      'elapsed_time': displayData.elapsedTime,
      'target_time': displayData.targetTime,
      'created_at': displayData.dateTime.toString()
    },
      where: 'id = ?',
      whereArgs: [displayData.id]
    );
  }
}
