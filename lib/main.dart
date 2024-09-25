import 'package:blink_alarm_clock_app/Providers/timer_provider.dart';
import 'package:blink_alarm_clock_app/firebase_options.dart';
import 'package:blink_alarm_clock_app/models/enums_menu_type.dart';
import 'package:blink_alarm_clock_app/models/menu_info.dart';
import 'package:blink_alarm_clock_app/screens/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MenuInfo>(
          create: (context) => MenuInfo(MenuType.clock),
        ),
        ChangeNotifierProvider<TimerProvider>(
          create: (context) => TimerProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Garet'),
        home: const HomePage(),
      ),
    );
  }
}
