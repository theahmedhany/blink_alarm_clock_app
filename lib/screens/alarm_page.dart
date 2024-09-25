import 'package:blink_alarm_clock_app/widgets/alarm_header.dart';
import 'package:blink_alarm_clock_app/widgets/alarm_list.dart';
import 'package:blink_alarm_clock_app/widgets/add_alarm_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlarmPage extends StatefulWidget {
  const AlarmPage({super.key});

  @override
  State<AlarmPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 32, right: 32, top: 64, bottom: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AlarmHeader(),
          const AlarmList(),
          const AddAlarmButton(),
        ],
      ),
    );
  }
}
