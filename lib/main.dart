import 'package:flutter/material.dart';
import 'package:sunkiss/pages/about.dart';
import 'package:sunkiss/pages/index.dart';
import 'package:sunkiss/pages/profile.dart';

void main(List<String> args) {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sunkiss",
      debugShowCheckedModeBanner: false,
      // home: const Index(),
      initialRoute: "/",
      routes: {
        "/": (BuildContext context) => const Index(),
        "/profile": (BuildContext context) => const Profile(),
        "/about": (BuildContext context) => const About(),
      },
    );
  }
}
