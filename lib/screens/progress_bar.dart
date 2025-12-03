import 'package:flutter/material.dart';
import 'package:task_9/screens/screen_template.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    super.key,
    required this.w,
    required this.widget,
    required this.h,
  });

  final double w;
  final ScreenTemplate widget;
  final double h;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.all(w * 0.02),
          child: Text(
            'Question ${widget.pageIndex + 1}/${widget.totalQuestions}',
            style: TextStyle(fontSize: w * 0.045, color: Colors.white),
          ),
        ),
        Container(
          width: w * 0.5,
          height: h * 0.012,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(5),
          ),
          child: FractionallySizedBox(
            widthFactor: (widget.pageIndex + 1) / widget.totalQuestions,
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
    );
  }
}
