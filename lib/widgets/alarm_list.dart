import 'package:blink_alarm_clock_app/widgets/alarm_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:blink_alarm_clock_app/constants/colors.dart';

class AlarmList extends StatelessWidget {
  const AlarmList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('alarm').snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingView();
        }

        if (snapshot.data!.docs.isEmpty) {
          return const NoAlarmView();
        }

        final data = snapshot.data;
        return Expanded(
          child: ListView.builder(
            itemCount: data?.docs.length,
            itemBuilder: (context, index) {
              Timestamp t = data?.docs[index].get('time');
              DateTime date = t.toDate();
              String formattedTime = DateFormat.jm().format(date);
              bool on = data!.docs[index].get('onOff');

              return AlarmItem(
                id: data.docs[index].id,
                formattedTime: formattedTime,
                on: on,
                time: data.docs[index].get('time'),
                index: index,
              );
            },
          ),
        );
      },
    );
  }
}

class LoadingView extends StatelessWidget {
  const LoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height / 4),
          CircularProgressIndicator(
            strokeWidth: 6,
            valueColor: AlwaysStoppedAnimation<Color>(kLightWhite),
          ),
          SizedBox(height: 10),
          Text(
            'Loading....',
            style: TextStyle(fontSize: 24, color: kLightWhite),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 3),
        ],
      ),
    );
  }
}

class NoAlarmView extends StatelessWidget {
  const NoAlarmView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height / 4),
          Text(
            'Nothing to show!',
            style: TextStyle(fontSize: 24, color: kLightWhite),
          ),
          Text(
            'Add Alarm Now.',
            style: TextStyle(fontSize: 24, color: kLightWhite),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 3),
        ],
      ),
    );
  }
}
