import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:qr/src/models/scan_model.dart';
export 'package:qr/src/models/scan_model.dart';

class DBprovider {
  
  static Database _database;
  static final DBprovider db = DBprovider._();  
  DBprovider._();

  Future<Database> get database async{
    if(_database != null ) return _database;

    _database = await initDB();
    return _database;
  }

  initDB() async{
    Directory documentoDirectorio = await getApplicationDocumentsDirectory();
    final path = join(documentoDirectorio.path, 'ScansDB.db');
    return await openDatabase(
      path,
      version:1,
      onOpen: (db){print('myDatabases');},
      onCreate: (Database db, int version) async{
        await db.execute(
          'CREATE TABLE Scans ('
            'id INTEGER PRIMARY KEY,'
            'tipo TEXT,'
            'valor TEXT'
        ')'
        );
      }
      );
  }
  /// CREAR REGISTROS PARA LA BASE DE DATOS
  
  nuevoScanRaw(ScanModel nuevoScan) async{
    final db = await database;
    final res = await db.rawInsert(
      "INSERT Into Scans (id, tipo, valor) "
      "VALUES ('${nuevoScan.id}', '${nuevoScan.tipo}', '${nuevoScan.valor}')"
    );
    print(res); 
    return res;
  }

  nuevoScan(ScanModel nuevoScan)async{
    final db = await database;
    final res = await db.insert('Scans', nuevoScan.toJson());
    print("A new register was added $nuevoScan");
    return res;
  }

  /////select obtener informacion
  
  Future<ScanModel> getScanId(int id)async{
    final db = await database;
    final res = await db.query('Scans',
      where: 'id=?',
      whereArgs: [id],
    ); 
    var respuesta = res.isEmpty ? ScanModel.fromJson(res.first) : null;
    print("The register with id: $id, was get it");
    return respuesta;
  }

  Future<List<ScanModel>> getScanAll()async{
    final db = await database;
    final res = await db.query('Scans');
    List<ScanModel> myList = res.isNotEmpty ? res.map((c) => ScanModel.fromJson(c)).toList():[]; 
    print("All register, was get it");
    return myList;
  }

  Future<List<ScanModel>> getScanPorTipo(String tipo)async{
    final db = await database;
    final res = await db.rawQuery("SELECT * FROM Scans WHERE tipo='$tipo'"); 
    List<ScanModel> myList = res.isNotEmpty ? res.map((c) => ScanModel.fromJson(c)).toList():[];
    print("The register with type: $tipo, was get it");
    return myList;
  }

  // Actualizar registros

  Future<int> upDateScan(ScanModel nuevoScan)async{
    final db = await database;
    final res = await db.update('Scans', nuevoScan.toJson(),
      where: 'id=?', whereArgs: [nuevoScan.id]);
      print("The register with id: $nuevoScan.id, was updated");
    return res;
  }

  //delete registers
  Future<int> deleteScan(int id) async {
    final db = await database;
    final res = await db.delete('Scans', where: 'id=?',whereArgs: [id]);
    print("The register with id: $id, was elminated");
    return res;
  }
  //delete registers
  Future<int> deleteAll() async {
    final db = await database;
    final res = await db.rawDelete('DELETE FROM Scans');
    print("All registers was elminated");
    return res;
  }
   
}