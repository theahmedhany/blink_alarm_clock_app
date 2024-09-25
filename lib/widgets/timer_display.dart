import 'package:blink_alarm_clock_app/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimerDisplay extends StatelessWidget {
  final int remainingTime;
  final int initialTime;
  final VoidCallback onTimeTap;

  const TimerDisplay({
    Key? key,
    required this.remainingTime,
    required this.initialTime,
    required this.onTimeTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CupertinoButton(
          onPressed: onTimeTap,
          child: SizedBox(
            height: 250,
            width: 250,
            child: CircularProgressIndicator(
              backgroundColor: kLightWhite,
              value: initialTime > 0 ? remainingTime / initialTime : 0,
              strokeWidth: 5,
              color: kLightBlueishPurple,
            ),
          ),
        ),
        CupertinoButton(
          onPressed: onTimeTap,
          child: Text(
            _formatTime(remainingTime),
            style: TextStyle(
              fontFamily: 'DIGI',
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: kLightWhite,
            ),
          ),
        ),
      ],
    );
  }

  String _formatTime(int totalSeconds) {
    int hours = totalSeconds ~/ 3600;
    int minutes = (totalSeconds % 3600) ~/ 60;
    int seconds = totalSeconds % 60;

    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}
