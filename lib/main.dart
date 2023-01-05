import 'package:flutter/material.dart';
import 'package:learning_flutter/screen/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
      // home: const UserSetting(),
      // home: const BottomNaviButtons(),
      // home: const Test(),
    );
  }
}
