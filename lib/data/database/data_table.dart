class DataTable {
  static final tableName = "user_table";
  static final String id = "id";
  static final String name = "name";
  static final String cell = "cell";
  static final String isAdded = "isAdded";

  static final String create =
      "CREATE TABLE $tableName($id TEXT PRIMARY KEY NOT NULL, $name TEXT, $cell TEXT, $isAdded TEXT)";
}
