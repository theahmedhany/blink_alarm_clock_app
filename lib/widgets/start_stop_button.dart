import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:blink_alarm_clock_app/constants/colors.dart';

class StartStopButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isRunning;

  const StartStopButton({
    super.key,
    required this.onPressed,
    required this.isRunning,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      child: Container(
        alignment: Alignment.center,
        width: 250,
        height: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(300),
          border: Border.all(
            width: 5,
            color: isRunning ? Colors.red : kLightPurple,
          ),
        ),
        child: Text(
          isRunning ? "Stop" : "Start",
          style: TextStyle(
            fontFamily: 'avenir',
            fontSize: 38,
            fontWeight: FontWeight.bold,
            color: kLightWhite,
          ),
        ),
      ),
    );
  }
}
