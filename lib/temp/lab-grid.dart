import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Topics'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedItem = 0;

  List topics = <Widget>[
    TopicCon(
      imageProvider: AssetImage("content.jpg"),
    ),
    TopicCon(
      imageProvider: AssetImage("blog.jpg"),
    ),
    TopicCon(
      imageProvider: AssetImage("blog.jpg"),
    ),
    TopicCon(
      imageProvider: AssetImage("content.jpg"),
    ),
    TopicCon(
      imageProvider: AssetImage("content.jpg"),
    ),
    TopicCon(
      imageProvider: AssetImage("blog.jpg"),
    ),
    TopicCon(
      imageProvider: AssetImage("blog.jpg"),
    ),
    TopicCon(
      imageProvider: AssetImage("content.jpg"),
    ),
    TopicCon(
      imageProvider: AssetImage("content.jpg"),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white10,
        appBar: AppBar(
          backgroundColor: Colors.black.withOpacity(0.6),
          title: Text(widget.title),
        ),
        drawer: Drawer(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 150,
                color: Colors.black.withOpacity(0.6),
                child: SafeArea(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage("dog.jpg"),
                          radius: 40,
                        ),
                        Text(
                          "Estifanos Neway",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text("0987654321")
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Icon(Icons.email),
                  SizedBox(
                    width: 25,
                  ),
                  Text("estifanos@gmail.com")
                ],
              ),
              Row(
                children: [
                  Icon(Icons.link),
                  SizedBox(
                    width: 25,
                  ),
                  Text("estifanos.com")
                ],
              )
            ],
          ),
        ),
        body: Container(
          child: GridView.builder(
            itemCount: 9,
            itemBuilder: (BuildContext context, int index) {
              return topics[index];
            },
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "search"),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "liked"),
          ],
          currentIndex: _selectedItem,
          onTap: (int index) {
            setState(() {
              _selectedItem = index;
            });
          },
        ),
      ),
    );
  }
}

class TopicCon extends StatelessWidget {
  ImageProvider imageProvider;
  IconData iconData;
  TopicCon({required this.imageProvider, this.iconData = Icons.favorite});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      constraints: BoxConstraints.expand(
        width: 200,
        height: 200,
      ),
      decoration: BoxDecoration(
          image: DecorationImage(image: imageProvider, fit: BoxFit.cover)),
      child: Column(
        children: [
          Expanded(
            child: Container(),
          ),
          Container(
            constraints: BoxConstraints.expand(height: 50),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Topic Title",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text("Topic Summary", style: TextStyle(color: Colors.white))
                  ],
                ),
                SizedBox(
                  width: 15,
                ),
                Icon(iconData, color: Colors.white),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
