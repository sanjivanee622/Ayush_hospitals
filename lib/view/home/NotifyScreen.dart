import 'package:flutter/material.dart';
import 'package:ayush_hospitals/utils/color_utils.dart';

class NotifyScreen extends StatefulWidget {
  const NotifyScreen({Key? key}) : super(key: key);

  @override
  _NotifyScreenState createState() => _NotifyScreenState();
}

class _NotifyScreenState extends State<NotifyScreen> {
  List<String> Notifys = [
    "Ayurvedic Hospital Launches Online Consultations! Access holistic healthcare from anywhere.",

"Ayurvedic Cooking Class Reminder! Learn nutritious recipes at [hospital name].",

"Special Ayurvedic Wellness Package! Experience rejuvenation & relaxation today.",
"New Ayurvedic Hospital Now Open! Discover traditional treatments & modern care in [location].",

"Free Health Camp Alert! Get Ayurvedic consultations & medicines in [rural area].",

"Join Holistic Wellness Seminar! Learn Ayurvedic lifestyle tips at [hospital name].",

"Learn Ayurvedic Medicine Making! Workshop on quality control & sustainability.",

"Research Project Alert! Ayurvedic hospitals unite to study chronic disease treatments.",

"Yoga Retreat Notification! Relax with Ayurvedic therapies in [scenic location].",

"Health Awareness Campaign! Learn Ayurvedic lifestyle benefits near you.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        titleTextStyle: const TextStyle(color: Colors.green, fontSize: 25),
        centerTitle: true, // Align title text along the center
        // toolbarHeight: 65, // Increase the height of the AppBar
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
        child: ListView.builder(
          itemCount: Notifys.length,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.all(8.0),
    color: const Color.fromARGB(255, 5, 96, 8).withOpacity(0.2), // 80% transparent white
               // 80% transparent white
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
                side: BorderSide(
                    color: Colors.white.withOpacity(0.4),
                    width: 2.0), // 40% Opacity white border
              ),
              child: ListTile(
                title: Text(
                  "${index + 1}. ${Notifys[index]}",
                  style: TextStyle(color: Colors.white), // White text color
                ),
                trailing: IconButton(
  icon: Icon(
    Icons.delete,
    color: Colors.white, // Set icon color to red
  ),
  onPressed: () {
    setState(() {
      Notifys.removeAt(index);
    });
  },
),
              ),
            );
          },
        ),
      ),
    );
  }
}
