import 'package:flutter/material.dart';
import 'package:task_9/core/constants.dart';
import 'package:task_9/widgets/answer_button.dart';

class ScreenTemplate extends StatefulWidget {
  const ScreenTemplate({super.key});

  @override
  State<ScreenTemplate> createState() => _ScreenTemplateState();
}

class _ScreenTemplateState extends State<ScreenTemplate> {
  int pageIndex = 0;

  int? selectedAnswerIndex; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Simple Quiz App',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),

          SizedBox(height: 20),

          /// --- Top progress and question number ---
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Question ${pageIndex + 1}/4',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              Container(
                width: 200,
                height: 10,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: FractionallySizedBox(
                  widthFactor: (pageIndex + 1) / 4,
                  heightFactor: 1.0,
                  alignment: Alignment.centerLeft,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.yellowAccent,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 20),

          /// --- Question Box ---
          Stack(
            children: [
              Container(
                margin: EdgeInsets.all(20.0),
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    Constants.questions[pageIndex],
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 40,
                child: CircleAvatar(radius: 20, backgroundColor: Colors.black),
              ),
              Positioned(
                top: 40,
                left: 350,
                child: CircleAvatar(radius: 20, backgroundColor: Colors.black),
              ),
              Positioned(
                left: 170,
                top: 5,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.check, color: Colors.green, size: 40),
                ),
              ),
            ],
          ),

          SizedBox(height: 20),

          /// --- ANSWER BUTTONS ---
          AnswerButton(
            text: Constants.answers[Constants.questions[pageIndex]]!.keys
                .elementAt(0),
            isSelected: selectedAnswerIndex == 0,
            onTap: () {
              setState(() => selectedAnswerIndex = 0);
            },
          ),
          SizedBox(height: 20),

          AnswerButton(
            text: Constants.answers[Constants.questions[pageIndex]]!.keys
                .elementAt(1),
            isSelected: selectedAnswerIndex == 1,
            onTap: () {
              setState(() => selectedAnswerIndex = 1);
            },
          ),
          SizedBox(height: 20),

          AnswerButton(
            text: Constants.answers[Constants.questions[pageIndex]]!.keys
                .elementAt(2),
            isSelected: selectedAnswerIndex == 2,
            onTap: () {
              setState(() => selectedAnswerIndex = 2);
            },
          ),
          SizedBox(height: 20),

          AnswerButton(
            text: Constants.answers[Constants.questions[pageIndex]]!.keys
                .elementAt(3),
            isSelected: selectedAnswerIndex == 3,
            onTap: () {
              setState(() => selectedAnswerIndex = 3);
            },
          ),

          SizedBox(height: 60),

          ActiveButton(text: 'Next'),
        ],
      ),
    );
  }
}
