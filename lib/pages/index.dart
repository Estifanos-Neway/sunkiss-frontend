import 'package:flutter/material.dart';
import 'package:sunkiss/commons/variables.dart';
import 'package:sunkiss/pages/home.dart';
import 'package:sunkiss/pages/liked.dart';
import 'package:sunkiss/pages/search.dart';
import 'package:sunkiss/pages/settings.dart';

class Index extends StatefulWidget {
  const Index({Key? key}) : super(key: key);

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  int currentIndex = 0;
  List<Widget> indexBodyWidgets = [
    Home(),
    const Liked(),
    const Search(),
    const Settings(),
  ];
  void setCurrentIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Container(
            padding: const EdgeInsets.fromLTRB(20, 5, 25, 5),
            decoration: BoxDecoration(
              color: local_colors["background"],
              boxShadow: [
                BoxShadow(
                    color: local_colors["background"]!,
                    // offset: Offset.fromDirection(1,2),
                    blurRadius: 2,
                    spreadRadius: 1),
              ],
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    local_platformDisplayName,
                    style: TextStyle(
                        color: local_colors["onBackground"],
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  const CircleAvatar(
                    foregroundImage: AssetImage("assets/images/dog.jpg"),
                    radius: 10,
                  )
                ]),
          )),
      body: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          scrollbars: false,
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: indexBodyWidgets[currentIndex],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: local_colors["background"],
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: local_colors["onBackground"],
        selectedItemColor: local_colors["primary"],
        showUnselectedLabels: false,
        showSelectedLabels: false,
        currentIndex: currentIndex,
        onTap: setCurrentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "-",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: "-",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "-",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "-",
          ),
        ],
      ),
    );
  }
}
