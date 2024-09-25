import 'package:flutter/material.dart';

class AlarmHeader extends StatelessWidget {
  const AlarmHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          SizedBox(
            width: 30,
            height: 30,
            child: Image.asset('assets/images/alarm_icon.png'),
          ),
          const SizedBox(width: 10),
          const Text(
            "Alarm",
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
