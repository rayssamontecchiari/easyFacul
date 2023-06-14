import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), "courses.db");

  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(tableSql);
    },
    version: 1,
  );
}
