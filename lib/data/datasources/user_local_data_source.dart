import 'package:interview_review_app/data/database/data_table.dart';
import 'package:interview_review_app/data/database/db_client.dart';
import 'package:interview_review_app/data/model/results.dart';
import 'package:interview_review_app/data/model/userdata.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sql.dart';

class UserLocalDataSource {
  DBClient dbClient;

  UserLocalDataSource(this.dbClient);

  Future<void> saveUser(UserData userData) async {
    var database = await dbClient.database;
    userData.results.forEach((element) async {
      await database.insert(
          DataTable.tableName,
          {
            DataTable.cell: element.cell,
            DataTable.name: element.fullName,
            DataTable.isAdded: element.isAdded,
          },
          conflictAlgorithm: ConflictAlgorithm.replace);
    });
  }

  Future<UserData> getUser() async {
    var database = await dbClient.database;
    List<Map<String, dynamic>> mapValues =
        await database.query(DataTable.tableName);

    List<Results> results = mapValues.map((value) {
      return Results(
        cell: value['cell'],
        isAdded: value['isAdded'],
        fullName: value['name'],
      );
    }).toList();

    return UserData(results: results);
  }

  Future<int> getCount() async {
    var database = await dbClient.database;
    int count = Sqflite.firstIntValue(await database
        .rawQuery('SELECT COUNT (*) FROM ${DataTable.tableName}'));

    return count;
  }
}
