import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:blink_alarm_clock_app/constants/colors.dart';

class StopWatchDisplay extends StatelessWidget {
  final String displayTime;
  final VoidCallback onPressed;

  const StopWatchDisplay({
    super.key,
    required this.displayTime,
    required this.onPressed,
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
            color: kLightPurple,
          ),
        ),
        child: Text(
          displayTime,
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
