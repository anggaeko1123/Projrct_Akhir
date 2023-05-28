import 'package:mysql1/mysql1.dart';

class Database {
  static Future<MySqlConnection> getConnection() async {
    var settings = ConnectionSettings(
      host: 'localhost',
      port: 3306,
      user: 'root',
      password: '',
      db: 'db_flutter',
    );
    var conn = await MySqlConnection.connect(settings);
    return conn;
  }
}
