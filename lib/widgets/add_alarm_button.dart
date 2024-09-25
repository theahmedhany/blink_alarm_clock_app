import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:blink_alarm_clock_app/constants/colors.dart';
import 'package:blink_alarm_clock_app/widgets/add_alarm.dart';

class AddAlarmButton extends StatelessWidget {
  const AddAlarmButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18),
      child: DottedBorder(
        strokeWidth: 2,
        color: kLightWhite,
        borderType: BorderType.RRect,
        radius: const Radius.circular(24),
        dashPattern: const [5, 4],
        child: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            addAlarm(context);
          },
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: kDarkBlue,
              borderRadius: BorderRadius.circular(24),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 32,
              vertical: 20,
            ),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/add_alarm.png',
                  scale: 1.5,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Add Alarm',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
