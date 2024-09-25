import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:blink_alarm_clock_app/constants/colors.dart';

class ResetButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ResetButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      child: Container(
        width: 80,
        height: 80,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: kDarkBlue,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Icon(
          Icons.replay,
          size: 35,
          color: kLightWhite,
        ),
      ),
    );
  }
}
