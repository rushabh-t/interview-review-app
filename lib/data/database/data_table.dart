class DataTable {
  static final tableName = "user_table";
  static final String id = "id";
  static final String name = "name";
  static final String cell = "cell";
  static final String isAdded = "isAdded";

  static final String create =
      "CREATE TABLE $tableName($id INTEGER PRIMARY KEY AUTOINCREMENT, $name TEXT, $cell TEXT, $isAdded TEXT)";
}
