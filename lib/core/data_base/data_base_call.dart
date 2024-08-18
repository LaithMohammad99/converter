import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:taske_bloc_converte/model/currency.dart';

class DatabaseHelper {
  int index=0;

  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      return await initDB();
    } else {
      return initDB();
    }
  }

  initDB() async {
    String dataBasePath = await getDatabasesPath();
    String path = join(dataBasePath, "currency.dp");
    Database currencyDb =
        await openDatabase(path, onCreate: _onCreate, version: 1);
    return currencyDb;
  }

  _onCreate(Database database, int v) async {
    database.execute('''CREATE TABLE 'currency' (
    id TEXT,currencyName TEXT,currencySymbol TEXT)
        ''');

    print("Create DATA BASE AND TABLE ========================");
  }

  Future<List<Map<String, dynamic>>> readData(String sql) async {
    Database? myDB = await initDB();
    List<Map<String, dynamic>> response = await myDB!.rawQuery(sql);
    return response;
  }

  insertData(Currency q) async {
    Database? myDB = await db;
    int response = await myDB!.insert('currency', {
      'id': q.id,
      'currencyName': q.currencyName,
      'currencySymbol': q.currencySymbol,
    });
    return response;
  }
}
