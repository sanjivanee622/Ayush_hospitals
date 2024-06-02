import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ayush_hospitals/view/login/signin_screen.dart';
import 'package:ayush_hospitals/view/feedback/FeedbackForm.dart';
import 'package:ayush_hospitals/view/about/AboutUsPage.dart';
import 'package:ayush_hospitals/utils/color_utils.dart';
import 'package:ayush_hospitals/view/home/ProfileScreen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  late User _user; // User object to store current user

  @override
  void initState() {
    super.initState();
    // Retrieve current user when the widget initializes
    _user = FirebaseAuth.instance.currentUser!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Holistic Heal",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 1,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        titleTextStyle: const TextStyle(color: Colors.green, fontSize: 26),
        centerTitle: true,
      ),
      body: Container(
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 5, 96, 8).withOpacity(0.2),
                borderRadius: BorderRadius.circular(16.0),
                border: Border.all(
                  color: Colors.white.withOpacity(0.4),
                  width: 2.0,
                ),
              ),
              width: 350,
              height: 100,
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://static-00.iconduck.com/assets.00/s-letter-icon-512x512-lgw2n52r.png'),
                        radius: 20,
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _user.displayName ?? 'Sanjivanee2041',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            _user.email ?? 'user@example.com',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 5, 96, 8).withOpacity(0.2),
                borderRadius: BorderRadius.circular(16.0),
                border: Border.all(
                  color: Colors.white.withOpacity(0.4),
                  width: 2.0,
                ),
              ),
              width: 350,
              height: 452,
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildListTile(Icons.dark_mode, 'Dark Mode', () {}),
                  _buildDivider(),
                  _buildListTile(Icons.share, 'Share', () {}),
                  _buildDivider(),
                  _buildListTile(Icons.feedback, 'Feedback', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              FeedbackForm()), // Navigate to FeedbackForm
                    );
                  }),
                  _buildDivider(),
                  _buildListTile(Icons.info, 'About Us', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              AboutUsScreen()), // Navigate to FeedbackForm
                    );
                  }),
                  _buildDivider(),
                  _buildListTile(Icons.language, 'Language', () {}),
                  _buildDivider(),
                  _buildLogoutTile(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      tileColor: Colors.white,
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap, // Call the onTap function passed from outside
    );
  }

  Widget _buildDivider() {
    return Divider(
      thickness: 1.0,
      color: const Color.fromARGB(255, 255, 255, 255),
    );
  }

  Widget _buildLogoutTile() {
    return ListTile(
      tileColor: Colors.white,
      leading: Icon(
        Icons.logout,
        color: Colors.white,
      ),
      title: Text(
        'Logout',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {
        FirebaseAuth.instance.signOut().then((value) {
          print("Signed Out");
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => SignInScreen(),
            ),
          );
        });
      },
    );
  }
}
