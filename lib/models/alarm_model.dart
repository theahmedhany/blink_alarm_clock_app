import 'package:cloud_firestore/cloud_firestore.dart';

class AlarmModel {
  Timestamp? timestamp;
  bool? onOff;

  AlarmModel({this.timestamp, this.onOff});

  Map<String, dynamic> toMap() {
    return {
      'time': timestamp,
      'onOff': onOff,
    };
  }

  factory AlarmModel.fromMap(map) {
    return AlarmModel(
      timestamp: map['time'],
      onOff: map['onOff'],
    );
  }
}
