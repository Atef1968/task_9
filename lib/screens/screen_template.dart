import 'package:flutter/material.dart';
import 'package:task_9/core/constants.dart';
import 'package:task_9/screens/progress_bar.dart';
import 'package:task_9/widgets/answer_button.dart';

class ScreenTemplate extends StatefulWidget {
  final int pageIndex;
  final VoidCallback onNext;
  final Function(int) onSelectAnswer;
  final int totalQuestions;
  final VoidCallback? onRestart;

  const ScreenTemplate({
    super.key,
    required this.pageIndex,
    required this.onNext,
    required this.onSelectAnswer,
    required this.totalQuestions,
    this.onRestart,
  });

  @override
  State<ScreenTemplate> createState() => _ScreenTemplateState();
}

class _ScreenTemplateState extends State<ScreenTemplate> {
  int? selectedAnswerIndex;
  bool showResult = false;

  @override
  void initState() {
    super.initState();
    selectedAnswerIndex = Constants.userAnswers[widget.pageIndex];
  }

  @override
  void didUpdateWidget(covariant ScreenTemplate oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Reset selection when page changes
    if (oldWidget.pageIndex != widget.pageIndex) {
      setState(() {
        selectedAnswerIndex = Constants.userAnswers[widget.pageIndex];
        showResult = false; // hide overlay
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    final question = Constants.questions[widget.pageIndex];
    final answerMap = Constants.answers[question]!;
    final answerKeys = answerMap.keys.toList();

    final bool isLast = widget.pageIndex == widget.totalQuestions - 1;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(children: resultBox(h, w, question, answerKeys, isLast)),
    );
  }

  List<Widget> resultBox(
    double h,
    double w,
    String question,
    List<String> answerKeys,
    bool isLast,
  ) {
    return [
      // MAIN QUIZ COLUMN
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: h * 0.04),

          // TITLE
          Center(
            child: Text(
              'Simple Quiz App',
              style: TextStyle(
                fontSize: w * 0.065,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: h * 0.02),

          // PROGRESS
          ProgressBar(w: w, widget: widget, h: h),

          SizedBox(height: h * 0.07),

          // QUESTION STACK
          Stack(
            children: [
              Container(
                margin: EdgeInsets.all(w * 0.05),
                padding: EdgeInsets.all(w * 0.08),
                width: w * 0.9,
                height: h * 0.15,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    question,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: w * 0.04,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: h * 0.075,
                left: w * 0.0008,
                child: CircleAvatar(
                  radius: w * 0.045,
                  backgroundColor: Colors.black,
                ),
              ),
              Positioned(
                top: h * 0.075,
                left: w * 0.91,
                child: CircleAvatar(
                  radius: w * 0.045,
                  backgroundColor: Colors.black,
                ),
              ),
              Positioned(
                left: w * 0.43,
                top: h * 0.001,
                child: CircleAvatar(
                  radius: w * 0.065,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.check, color: Colors.green, size: w * 0.10),
                ),
              ),
            ],
          ),

          SizedBox(height: h * 0.02),

          // ANSWERS
          for (int i = 0; i < answerKeys.length; i++) ...[
            AnswerButton(
              text: answerKeys[i],
              isSelected: selectedAnswerIndex == i,
              onTap: () {
                setState(() => selectedAnswerIndex = i);
                Constants.userAnswers[widget.pageIndex] = i;
                widget.onSelectAnswer(i);
              },
            ),
            SizedBox(height: h * 0.02),
          ],

          SizedBox(height: h * 0.05),

          // NEXT / SUBMIT BUTTON
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: selectedAnswerIndex == null
                  ? Colors.grey.shade700
                  : Colors.white,
              minimumSize: Size(w * 0.75, h * 0.07),
            ),
            onPressed: selectedAnswerIndex == null
                ? null
                : () {
                    if (isLast) {
                      setState(() => showResult = true);
                    } else {
                      widget.onNext();
                    }
                  },
            child: Text(
              isLast ? "Submit" : "Next",
              style: TextStyle(
                fontSize: w * 0.065,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),

      // OVERLAY RESULT BOX
      if (showResult) ...[
        Positioned.fill(child: Container(color: Colors.black54)),
        Center(
          child: Container(
            width: w * 0.8,
            padding: EdgeInsets.all(w * 0.06),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  Constants.calculateScore() >= 2
                      ? "Passed | Score ${Constants.calculateScore()}/${widget.totalQuestions}"
                      : "Failed | Score ${Constants.calculateScore()}/${widget.totalQuestions}",
                  style: TextStyle(
                    fontSize: w * 0.05,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: h * 0.03),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    minimumSize: Size(w * 0.5, h * 0.06),
                  ),
                  onPressed: () {
                    widget.onRestart?.call();
                    setState(() {
                      selectedAnswerIndex = null;
                      showResult = false;
                    });
                  },
                  child: Text(
                    "Restart",
                    style: TextStyle(
                      color: Colors.yellow,
                      fontSize: w * 0.045,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ];
  }
}
