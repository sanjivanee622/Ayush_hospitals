import 'package:ayush_hospitals/connections/database.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mysql_client/mysql_client.dart';
import 'package:mysql1/mysql1.dart';

class SortedMarkers {
  static var db = Mysql(db: 'sql6688600');

  static Future<List<List<dynamic>>> getSortedMarkers(
      String state, String district, String type) async {
    List<List<dynamic>> res = [];

    var conn = await db.getConnection();
    String query =
        "select Latitude,Longitude,Hospital_Id,Hospital_Name from sql6688600.ayush where State='$state' && District='$district' && Hospital_Type='$type'";

    var result = await conn.query(query);

    for (final row in result) {
      res.add([
        LatLng(
            double.parse(row[0].toString().replaceAll(RegExp('°'), '')),
            double.parse(row[1].toString().replaceAll(RegExp('°'), ''))),
        row[2],
        row[3]
      ]);
    }
    await conn.close();
    return res;
  }
}
