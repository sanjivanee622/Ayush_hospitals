import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ayush_hospitals/utils/color_utils.dart';
import 'package:intl/intl.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late TextEditingController _usernameController;
  late TextEditingController _dobController;
  late String _selectedGender;
  late User? _user;

  @override
  void initState() {
    super.initState();
    _user = FirebaseAuth.instance.currentUser;
    _usernameController =
        TextEditingController(text: _user?.displayName ?? "Sanjivanee2041");
    _dobController = TextEditingController(text: '06/02/2002');
    _selectedGender = 'Female'; // You may get this from Firebase as well
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    extendBodyBehindAppBar: true,
    appBar: AppBar(
      title: const Text(
        "Holistic Heal",
        style: TextStyle(
          // fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold, // Make the text bold
        ),
      ),
      elevation: 1,
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      titleTextStyle: const TextStyle(color: Colors.green, fontSize: 26),
      centerTitle: true, // Align title text along the center
      // toolbarHeight: 65, // Increase the height of the AppBar
    ),
    body: SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
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
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                          'https://static-00.iconduck.com/assets.00/s-letter-icon-512x512-lgw2n52r.png'),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: 350,
                      height: 380,
                      
                      decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 5, 96, 8).withOpacity(0.2), // 80% transparent white
 // 80% transparent white
                        borderRadius: BorderRadius.circular(16.0),
                        border: Border.all(
                          color:
                              Colors.white.withOpacity(0.4), // White border color
                          width: 2.0, // Border width
                        ),
                      ),
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildFieldRow("Username:-", _usernameController.text),
                          _buildDivider(),
                          _buildFieldRow("Email:-", _user?.email ?? "No Email"),
                          _buildDivider(),
                          _buildFieldRow("Date of Birth:-", _dobController.text),
                          _buildDivider(),
                          _buildFieldRow("Gender:-", _selectedGender),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _editProfile,
                      child: Text('Edit'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

  void _editProfile() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Edit Profile"),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(labelText: "Username"),
                ),
                TextField(
                  controller: _dobController,
                  decoration: InputDecoration(labelText: "Date of Birth"),
                ),
                DropdownButtonFormField(
                  value: _selectedGender,
                  items: ['Female', 'Male', 'Other'].map((String value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _selectedGender = newValue.toString();
                    });
                  },
                  decoration: InputDecoration(labelText: "Gender"),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: _saveProfile,
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _saveProfile() {
    // Save to Firebase or wherever needed
    setState(() {
      // Update the UI with the new data
    });
    Navigator.of(context).pop(); // Close the dialog
  }

  Widget _buildDivider() {
    return Divider(
      thickness: 1.0,
      color: const Color.fromARGB(255, 255, 255, 255),
    );
  }

  Widget _buildFieldRow(String label, String value) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 4), // Add space between label and value
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _dobController.dispose();
    super.dispose();
  }
}
