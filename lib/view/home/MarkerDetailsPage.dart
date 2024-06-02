import 'package:flutter/material.dart';
import 'package:ayush_hospitals/connections/database.dart'; // Import your database connection
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ayush_hospitals/utils/color_utils.dart';

class MarkerDetailsPage extends StatelessWidget {
  final String title;
  static var db = Mysql(db: 'sql6688600');

  MarkerDetailsPage({required this.title});

  static Future<List<List<dynamic>>> getDetailsFromDatabase(
      String title) async {
    List<List<dynamic>> res = [];

    var conn = await db.getConnection();
    String query = "SELECT * FROM ayush WHERE Hospital_Name = '$title'";

    var result = await conn.query(query);
    await conn.close();

    // Convert result to a List<List<dynamic>> format
    for (var row in result) {
      List<dynamic> rowData = [
        row['Sno'],
        row['Hospital_Id'],
        row['Hospital_Name'],
        row['State'],
        row['District'],
        row['Hospital_Type'],
        row['Specialities'],
        row['Pincode'],
        row['Latitude'],
        row['Longitude'],
        row['Beds'],
        row['Doctors'],
        row['Hospital_Contact'],
        row['Email_Id'],
        row['Website_URL'],
        row['Image'],
      ];
      res.add(rowData);
    }
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Hoilstic Heal",
          style: TextStyle(
            fontStyle: FontStyle.italic,
          ),
        ),
        elevation: 1,
        backgroundColor: Colors.black,
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 25),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              hexStringToColor("0FFF17"),
              hexStringToColor("24A42B"),
              hexStringToColor("20622C")
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: FutureBuilder(
          future: getDetailsFromDatabase(title),
          builder: (context, AsyncSnapshot<List<List<dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              List<List<dynamic>> data = snapshot.data!;
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  // Fetching image URL from index 14 of the current row
                  String imageUrl = data[index][15];

                  // Display the fetched details here
                  return Column(
                    children: [
                      if (index == 0)
                        Container(
                          width: 350,
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  imageUrl), // Use the fetched image URL
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      Container(
                        width: 350,
                        height: 650,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildFieldRow('Hospital Name:', data[index][2]),
                            _buildFieldRow('State:', data[index][3]),
                            _buildFieldRow('District:', data[index][4]),
                            _buildFieldRow('Hospital_Type:', data[index][5]),
                            _buildFieldRow('Specialities:', data[index][6]),
                            _buildFieldRow('Pincode:', data[index][7]),
                            _buildFieldRow('Beds:', data[index][10]),
                            _buildFieldRow('Doctors:', data[index][11]),
                            _buildFieldRow(
                                'Hospital_Contact:', data[index][12]),
                            _buildFieldRow('Email_Id:', data[index][13]),
                            _buildFieldRow('Website_URL:', data[index][14]),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      thickness: 1.0,
      color: Colors.black,
    );
  }

  Widget _buildFieldRow(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 12,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 5), // Adjust spacing between rows
      ],
    );
  }
}
