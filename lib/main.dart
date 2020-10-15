import 'package:flutter/material.dart';
import 'package:wishes_app/pages/home.dart';
import 'package:wishes_app/utils/style.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: primaryColor,
        accentColor: secondaryColor,

      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
