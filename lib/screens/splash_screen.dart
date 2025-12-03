

import 'package:flutter/material.dart';
import 'package:task_9/screens/quiz_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {
  @override
void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      if (!mounted) return;
      Navigator.pushReplacement (context, MaterialPageRoute(builder: (context) => QuizScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 160),
            Image.asset('assets/images/quiz.png', width: double.infinity, height: 300),
            SizedBox(height: 10),
            Text(
              'QUIZ APP',
              style: TextStyle(
                color: Colors.yellowAccent,
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(
              color: Colors.white,
            ),
          ],
        ),
        
        
    )
    );
  }
}