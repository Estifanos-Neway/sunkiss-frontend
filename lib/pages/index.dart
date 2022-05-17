import 'package:flutter/material.dart';
import 'package:Sunkiss/commons/variables.dart';
import 'package:Sunkiss/pages/home.dart';
import 'package:Sunkiss/pages/saved.dart';
import 'package:Sunkiss/pages/search.dart';
import 'package:Sunkiss/pages/account.dart';
// import 'package:Sunkiss/widgets/custom-app-bar.dart';

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
    const Saved(),
    const Search(),
    const Account(),
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
    return Scaffold(
      
      body: Container(
        color: local_colors["background"],
        child: indexBodyWidgets[currentIndex],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: local_colors["surface"],
        ),
        child: TabBar(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 7,
          ),
          controller: _tabController,
          unselectedLabelColor: local_colors["onSurface"],
          labelColor: local_colors["onSurface"],
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
              Icons.person,
            ),
          ],
        ),
      ),
    );
  }
}
