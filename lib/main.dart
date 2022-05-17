import 'package:flutter/material.dart';
import 'package:Sunkiss/commons/variables.dart';
import 'package:Sunkiss/states/app-state.dart';
import 'package:Sunkiss/states/blocs/bloc-provider.dart';
import 'package:Sunkiss/states/blocs/content-bloc.dart';
import 'package:Sunkiss/pages/about.dart';
import 'package:Sunkiss/pages/index.dart';

void main(List<String> args) {
  BlocProvider blocProvider = BlocProvider(
    contentBloc: ContentBloc(),
  );
  runApp(
    AppStateController(
      blocProvider: blocProvider,
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sunkiss",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: local_colors["background"],
        backgroundColor: local_colors["background"],
      ),
      initialRoute: "/",
      routes: {
        "/": (BuildContext context) => const Index(),
        "/about": (BuildContext context) => const About(),
      },
    );
  }
}
