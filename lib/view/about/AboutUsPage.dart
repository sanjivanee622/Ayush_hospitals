import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

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
        titleTextStyle: const TextStyle(color: Colors.green, fontSize: 25),
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
                const Color.fromARGB(255, 15, 255, 23),
                const Color.fromARGB(255, 36, 164, 43),
                const Color.fromARGB(255, 32, 98, 44)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 50),
                  Text(
                    "About Holistic Heal",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Holistic Heal is your go-to app for discovering Ayush hospitals in India specializing in Ayurveda, Yoga, and Unani practices. We simplify the search process, connecting you with trusted practitioners for your holistic wellness journey.",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Our Team",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Sanjivanee Kumbhar: Developer \n Prachi Pawar : Data Analyst \n  Diya Pathare: Researcher \n Prachi Kulkarni: Content Writer",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
