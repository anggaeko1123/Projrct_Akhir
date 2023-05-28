// import 'dart:async';
// import 'package:mysql1/mysql1.dart';
// import 'package:paproject/NyobaLogin/user.dart';
//
// class DatabaseHelper {
//   final String host = 'localhost';
//   final int port = 3306;
//   final String user = 'your_mysql_username';
//   final String password = 'your_mysql_password';
//   final String db = 'db_flutter';
//
//   Future<MySqlConnection> _getConnection() async {
//     return await MySqlConnection.connect(ConnectionSettings(
//       host: host,
//       port: port,
//       user: user,
//       password: password,
//       db: db,
//     ));
//   }
//
//   Future<int?> createUser(User user) async {
//     try {
//       final conn = await _getConnection();
//       final result = await conn.query(
//           'INSERT INTO users (username, password) VALUES (?, ?)',
//           [user.username, user.password]);
//       await conn.close();
//       return result.insertId;
//     } on MySqlException catch (e) {
//       print(e.message);
//       return -1;
//     }
//   }
//
//   Future<User?> getUserByUsername(String username) async {
//     try {
//       final conn = await _getConnection();
//       final result = await conn.query(
//           'SELECT * FROM users WHERE username = ?', [username]);
//       await conn.close();
//       if (result.length > 0) {
//         return User.fromMap(result.first.fields);
//       } else {
//         return null;
//       }
//     } on MySqlException catch (e) {
//       print(e.message);
//       return null;
//     }
//   }
// }
