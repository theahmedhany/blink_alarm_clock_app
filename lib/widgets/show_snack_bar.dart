import 'package:blink_alarm_clock_app/constants/colors.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(milliseconds: 900),
      behavior: SnackBarBehavior.floating,
      backgroundColor: kLightBlue.withOpacity(0.4),
      content: Text(
        message,
        style: TextStyle(
          color: kLightWhite,
          fontSize: 18,
          fontWeight: FontWeight.w800,
        ),
      ),
    ),
  );
}
