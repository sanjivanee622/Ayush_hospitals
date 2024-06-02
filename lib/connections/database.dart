import 'package:mysql1/mysql1.dart';

class Mysql {
  String host = 'sql6.freesqldatabase.com';
  String user = 'sql6688600';
  String password = 'qmR4MqGNrs';
  String db;
  int port = 3306;

  Mysql({required this.db});

   Future<MySqlConnection> getConnection() async {
    var settings = ConnectionSettings(
      host: host,
      port: port,
      user: user,
      password: password,
      db: db,
      useSSL: false, // Set useSSL to false to disable SSL
    );

    var connection = await MySqlConnection.connect(settings);
    return connection;
    
  }
}
