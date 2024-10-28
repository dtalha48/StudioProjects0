import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home: const MyTabApp(),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        "/HomePage": (BuildContext context) => const MyTabApp(),
      }));
}

class MyTabApp extends StatefulWidget {
  const MyTabApp({super.key});

  @override
  _MyTabAppState createState() => _MyTabAppState();
}

class _MyTabAppState extends State<MyTabApp>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late int _selectedIndex = 0;

  List<Tab> topTabs = <Tab>[
    const Tab(text: "New York"),
    const Tab(text: "Los Angeles"),
    const Tab(text: "Chicago"),
    const Tab(text: "Houston"),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: topTabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget cityTab(String cityName, String imagePath, List<String> facts,
      String description) {
    return ListView(
      padding: const EdgeInsets.all(20.0),
      children: [
        Image.asset(imagePath, height: 200),
        const SizedBox(height: 20),
        Text(
          "$cityName Facts:",
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(height: 10),
        ...facts.map((fact) => Text("• $fact")),
        const SizedBox(height: 20),
        const Text("Description:",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        const SizedBox(height: 10),
        RichText(
          text: TextSpan(
            text: description,
            style: const TextStyle(color: Colors.black, fontSize: 16),
          ),
        ),
      ],
    );
  }

  List<Widget> myTabContent(BuildContext context) {
    return <Widget>[
      cityTab(
          "New York",
          'assets/newyork.jpg',
          [
            "Population: 8.3 million",
            "Known for the Statue of Liberty",
            "Central Park is one of the world's most famous parks",
            "Map of GTA4"
          ],
          "New York is one of the most iconic cities in the world, known for its diversity, culture, and landmarks.New York is 6 stars out of 10"),
      cityTab(
          "Los Angeles",
          'assets/losangeles.jpg',
          [
            "Population: 4 million",
            "Known for Hollywood",
            "Has great beaches",
            "Map of Gta 5"
          ],
          "Los Angeles is known for its Mediterranean climate, ethnic diversity, and the entertainment industry. 10 stars out of 10"),
      cityTab(
          "Chicago",
          'assets/chicago.jpg',
          [
            "Population: 2.7 million",
            "Known for its deep-dish pizza",
            "Home to the Willis Tower",
            "Map of Watch dogs "
          ],
          "Chicago is known for its magnificent architecture and vibrant cultural scene. 4 stars out of 10"),
      cityTab(
          "Houston",
          'assets/houston.jpg',
          [
            "Population: 2.3 million",
            "Known for NASA's Space Center",
            "Famous for its energy industry",
            "tesla headquarters is here"
          ],
          "Houston is a major hub for the energy industry and is home to NASA's Johnson Space Center. 6 stars out of 10"),
    ];
  }

  Drawer myDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(10.0),
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(40),
            ),
            child: const Text("Cities",
                style: TextStyle(color: Colors.white, fontSize: 24)),
          ),
          ListTile(
            title: const Text("New York"),
            onTap: () {
              Navigator.pop(context);
              _tabController.index = 0;
            },
          ),
          ListTile(
            title: const Text("Los Angeles"),
            onTap: () {
              Navigator.pop(context);
              _tabController.index = 1;
            },
          ),
          ListTile(
            title: const Text("Chicago"),
            onTap: () {
              Navigator.pop(context);
              _tabController.index = 2;
            },
          ),
          ListTile(
            title: const Text("Houston"),
            onTap: () {
              Navigator.pop(context);
              _tabController.index = 3;
            },
          ),
        ],
      ),
    );
  }

  BottomNavigationBar myBottomNavBar() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
          _tabController.index = index;
        });
      },
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.location_city, color: Colors.black),
            label: "New York",
            backgroundColor: Color.fromARGB(255, 42, 106, 151)),
        BottomNavigationBarItem(
            icon: Icon(Icons.beach_access_sharp, color: Colors.black),
            label: "Los Angeles",
            backgroundColor: Color.fromARGB(255, 42, 106, 151)),
        BottomNavigationBarItem(
            icon: Icon(Icons.egg_alt_rounded, color: Colors.black),
            label: "Chicago",
            backgroundColor: Color.fromARGB(255, 42, 106, 151)),
        BottomNavigationBarItem(
            icon: Icon(Icons.engineering_rounded, color: Colors.black),
            label: "Houston",
            backgroundColor: Color.fromARGB(255, 42, 106, 151)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("City Tourism App"),
        bottom: TabBar(
          controller: _tabController,
          tabs: topTabs,
        ),
      ),
      drawer: myDrawer(context),
      body: TabBarView(
        controller: _tabController,
        children: myTabContent(context),
      ),
      bottomNavigationBar: myBottomNavBar(),
    );
  }
}
