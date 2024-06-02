// import 'package:ayush_hospitals/view/home/my_map.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ayush_hospitals/view/login/signin_screen.dart';
// import 'package:ayush_hospitals/view/home/ProfileScreen.dart';
import 'package:ayush_hospitals/view/splash/splash_screen.dart';
import 'package:ayush_hospitals/widgets/CustomizedBottomNavigationbar.dart';
import 'package:ayush_hospitals/view/about/AboutUsPage.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBiax1i5DfEWHi9t4SuL7fyZb3mYVSMDQM",
      appId: "1:1071004870603:android:03e1472cb3b7b02f26b84e",
      messagingSenderId: "1071004870603",
      projectId: "ayush-hospitals-e0a65",
      databaseURL: "https://ayush-hospitals-e0a65-default-rtdb.asia-southeast1.firebasedatabase.app",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Holistic Heal',
      routes: {
        '/': (context) => const SplashScreen(
              // child: const CustomizedBottomNavigationbar(),
              child: const AboutUsScreen(),
            ),
      },
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
    );
  }
}
