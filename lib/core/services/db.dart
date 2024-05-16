import 'package:country_list/features/countries/data/data_sources/local/country_local_data_resources.dart';
import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';

class DBService {
  static const String databaseName = "MegaMusic.db";
  static Database? db;

  static Future<Database> initizateDb() async{
    final databasePath = await getDatabasesPath();
    final path = p.join(databasePath, databaseName);
    return db ?? await openDatabase(
      path, 
      version: 1,       
      onCreate: (Database db, int version) async {
        CountryDataResourcesLocal().createTables(db);
      },
    );
  }
}