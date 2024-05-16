import 'package:country_list/core/constants/db_constants.dart';
import 'package:country_list/core/services/db.dart';
import 'package:country_list/features/countries/data/models/country_model.dart';
import 'package:sqflite/sqflite.dart';

class CountryDataResourcesLocal {
  static String tblName = DBConstants.countryTblName;

  Future<void> createTables(Database database) async{
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tblName
      (${DBConstants.countryTblColumn[0]} TEXT NOT NULL, 
      ${DBConstants.countryTblColumn[1]} TEXT NOT NULL, 
      ${DBConstants.countryTblColumn[2]} TEXT NOT NULL,
      ${DBConstants.countryTblColumn[3]} TEXT NOT NULL)"""
    );
  }

  // Create
  Future<int> createItem(CountryModel data) async {
    final db = await DBService.initizateDb();

    final createdId = await db.insert(tblName, data.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
    return createdId;
  }

  // Read
  Future<List<CountryModel>> getItems() async {
    final db = await DBService.initizateDb();

    final List<Map<String, Object?>> queryResult = await db.query(tblName);
    return queryResult.map((e) => CountryModel.fromDbJson(e)).toList();
  }

  // Update
  Future<int> updateItem({required int id, required CountryModel updateData}) async {
    final db = await DBService.initizateDb();

    final updatedId = await db.update(tblName, updateData.toJson(), where: '${DBConstants.countryTblColumn[0]} = ?', whereArgs: [id]);
    return updatedId;
  }

  // Delete individual
  Future<int> deleteItemAt(int id) async {
    final db = await DBService.initizateDb();

    final deletedId = await db.delete(tblName, where: '${DBConstants.countryTblColumn[0]} = ?', whereArgs: [id]);
    return deletedId;
  }

  // Delete all
  static Future<void> deleteItem() async {
    final db = await DBService.initizateDb();

    await db.delete(tblName);
  }
} 