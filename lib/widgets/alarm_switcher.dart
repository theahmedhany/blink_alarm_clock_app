import 'package:blink_alarm_clock_app/constants/colors.dart';
import 'package:blink_alarm_clock_app/models/alarm_model.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AlarmSwitcher extends StatefulWidget {
  AlarmSwitcher(this.onOff, this.id, this.timestamp, {super.key});

  bool onOff;
  Timestamp timestamp;
  String id;

  @override
  State<AlarmSwitcher> createState() => _AlarmSwitcherState();
}

class _AlarmSwitcherState extends State<AlarmSwitcher> {
  @override
  Widget build(BuildContext context) {
    return Switch(
      activeColor: Colors.white,
      inactiveThumbColor: kMediumGrey,
      inactiveTrackColor: kMediumGrey.withOpacity(0.5),
      value: widget.onOff,
      onChanged: (bool value) {
        AlarmModel alarmModel = AlarmModel();
        alarmModel.onOff = value;
        alarmModel.timestamp = widget.timestamp;
        FirebaseFirestore.instance
            .collection('alarm')
            .doc(widget.id)
            .update(alarmModel.toMap());
      },
    );
  }
}
