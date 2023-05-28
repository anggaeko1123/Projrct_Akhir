import 'package:mysql1/mysql1.dart';
import 'package:myflutterapp/loginRegister/nyoba/database.dart';
import 'package:myflutterapp/nyoba/NyobaLogin/user.dart';

class UserRepository {
  static Future<User?> getUserByEmailAndPassword(String email, String password) async {
    var conn = await Database.getConnection();
    var results = await conn.query(
      'SELECT id, name, email FROM users WHERE email = ? AND password = ?',
      [email, password],
    );
    await conn.close();
    if (results.isNotEmpty) {
      var row = results.first;
      var user = User(
        id: row['id'],
        username: row['username'],
        email: row['email'],
        password: row['password'],
      );
      return user;
    } else {
      return null;
    }
  }

  static Future<void> addUser(String name, String email, String password) async {
    var conn = await Database.getConnection();
    await conn.query(
      'INSERT INTO users (name, email, password) VALUES (?, ?, ?)',
      [name, email, password],
    );
    await conn.close();
  }
}
