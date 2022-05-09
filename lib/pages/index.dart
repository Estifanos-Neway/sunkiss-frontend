import 'package:flutter/material.dart';
import 'package:sunkiss/commons/variables.dart';
import 'package:sunkiss/pages/home.dart';
import 'package:sunkiss/pages/profile.dart';
import 'package:sunkiss/pages/saved.dart';
import 'package:sunkiss/pages/search.dart';
import 'package:sunkiss/pages/settings.dart';
import 'package:sunkiss/widgets/custom-app-bar.dart';

class Index extends StatefulWidget {
  const Index({Key? key}) : super(key: key);
  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int currentIndex = 0;
  List<Widget> indexBodyWidgets = [
    Home(),
    Saved(),
    const Search(),
    const Settings(),
  ];

  @override
  void initState() {
    _tabController = TabController(
        length: 4,
        vsync: this,
        animationDuration: const Duration(milliseconds: 5));
    _tabController.addListener(_setCurrentIndex);
    super.initState();
  }

  void _setCurrentIndex() {
    if (!_tabController.indexIsChanging) {
      setState(() {
        currentIndex = _tabController.index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print(
      "Screen Size: ${MediaQuery.of(context).size.width} x ${MediaQuery.of(context).size.height}",
    );
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
      return Scaffold(
        appBar: CustomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/about");
                },
                child: Text(
                  local_platformDisplayName,
                  style: TextStyle(
                      color: local_colors["onBackground"],
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    "/profile",
                  );
                },
                child: CircleAvatar(
                  backgroundColor: local_colors["onBackground"],
                  foregroundImage: const AssetImage(
                    "assets/images/dog.jpg",
                  ),
                  radius: 10,
                ),
              )
            ],
          ),
        ),
        body: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(
            scrollbars: false,
          ),
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.minHeight,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: local_colors["background"],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: indexBodyWidgets[currentIndex],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: local_colors["bars"],
          ),
          child: TabBar(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
            controller: _tabController,
            unselectedLabelColor: local_colors["onBackground"],
            labelColor: local_colors["onBackground"],
            indicatorColor: local_colors["primary"],
            indicatorSize: TabBarIndicatorSize.label,
            tabs: const [
              Icon(
                Icons.home_filled,
              ),
              Icon(
                Icons.bookmark,
              ),
              Icon(
                Icons.search_outlined,
                size: 28,
              ),
              Icon(
                Icons.settings,
              ),
            ],
          ),
        ),
      );
    });
  }
}
