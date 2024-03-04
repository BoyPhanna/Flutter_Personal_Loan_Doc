import 'package:image_to_pdf/models/cliens_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static final DatabaseService instance = DatabaseService._init();
  static Database? _database;
  DatabaseService._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('cliens.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    // const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    // const textType = 'TEXT NOT NULL';
    // const boolType = 'BOOLEAN NOT NULL';
    // const integerType = 'INTEGER NOT NULL';

    await db.execute('''
CREATE TABLE cliens (
  _id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL,
  gender TEXT NOT NULL,
  dob TEXT NOT NULL,
  nationality TEXT NOT NULL,
  job TEXT NOT NULL,
  address TEXT NOT NULL,
  amount TEXT NOT NULL,  -- Change data type of 'amount' to REAL
  pay TEXT NOT NULL,
  date TEXT NOT NULL,
  numberlate TEXT NOT NULL
);
''');
  }

  Future<Clien> create(Clien clien) async {
    final db = await instance.database;
    final id = await db.insert(clienTable, clien.toJson());
    return clien.copy(id: id);
  }

  Future<Clien> readClien({required int id}) async {
    final db = await instance.database;

    final maps = await db.query(
      clienTable,
      columns: ClienFields.values,
      where: '${ClienFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Clien.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Clien>> readAllCliens() async {
    final db = await instance.database;
    const orderBy = '${ClienFields.id} ASC';
    final result = await db.query(clienTable, orderBy: orderBy);

    return result.map((json) => Clien.fromJson(json)).toList();
  }

  Future<int> update({required Clien clien}) async {
    final db = await instance.database;
    print("Update ID: " + clien.job.toString());
    return db.update(
      clienTable,
      clien.toJson(),
      where: '${ClienFields.id} = ?',
      whereArgs: [clien.id],
    );
  }

  Future<int> delete({required int id}) async {
    final db = await instance.database;

    return await db.delete(
      clienTable,
      where: '${ClienFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
