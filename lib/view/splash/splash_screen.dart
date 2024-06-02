import 'package:flutter/material.dart';
import 'package:ayush_hospitals/utils/color_utils.dart';

class SplashScreen extends StatefulWidget {
  final Widget? child;
  
  const SplashScreen({super.key, this.child});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => widget.child!),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              hexStringToColor("0FFF17"),
          hexStringToColor("24A42B"),
          hexStringToColor("20622C"),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 350,
                height: 350,
              )
              // child  Text(
              //   "Holistic Heal",
              //   style: TextStyle(
              //     color: Color.fromARGB(255, 19, 132, 61),
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
