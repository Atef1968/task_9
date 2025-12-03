import 'package:flutter/material.dart';
import 'package:task_9/core/constants.dart';
import 'screen_template.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  PageController pageController = PageController();
  int currentPage = 0;

  void goToNextPage() {
    if (currentPage < Constants.questions.length - 1) {
      currentPage++;
      pageController.animateToPage(
        currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() {}); // rebuild
    }
  }

  void restartQuiz() {
    Constants.userAnswers = [null, null, null, null];
    currentPage = 0;
    pageController.jumpToPage(0); // reset PageView
    setState(() {}); // rebuild first screen
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      physics: NeverScrollableScrollPhysics(), // disable swipe
      itemCount: Constants.questions.length,
      itemBuilder: (context, index) {
        return ScreenTemplate(
          pageIndex: index,
          totalQuestions: Constants.questions.length,
          onNext: goToNextPage,
          onSelectAnswer: (answerIndex) {
            Constants.userAnswers[index] = answerIndex;
          },
          onRestart: restartQuiz,
        );
      },
    );
  }
}
