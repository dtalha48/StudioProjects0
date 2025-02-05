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
  late String _username = '';
  late String _surname = '';

  List<Tab> topTabs = <Tab>[
    const Tab(text: "New York"),
    const Tab(text: "Los Angeles"),
    const Tab(text: "Chicago"),
    const Tab(text: "Houston"),
    const Tab(text: "About"),
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

  // Function to show the city content with facts and a link to a tourism agency
  Widget cityTab(String cityName, String imagePath, List<String> facts,
      String description, String tourismLink) {
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
        Text(description),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            _showProfileDialog(tourismLink);
          },
          child: const Text("Visit Tourism Agency"),
        ),
      ],
    );
  }

  // Profile dialog to collect user name and surname before visiting the link
  void _showProfileDialog(String tourismLink) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Enter Your Details"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'First Name'),
                onChanged: (value) {
                  setState(() {
                    _username = value;
                  });
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Last Name'),
                onChanged: (value) {
                  setState(() {
                    _surname = value;
                  });
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _navigateToTourismLink(tourismLink);
              },
              child: const Text("Submit"),
            ),
          ],
        );
      },
    );
  }

  // Navigate to the tourism agency link
  void _navigateToTourismLink(String tourismLink) {
    if (_username.isNotEmpty && _surname.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => TourismWebView(url: tourismLink)),
      );
    }
  }

  // Function to create the about page content
  Widget aboutPage() {
    return ListView(
      padding: const EdgeInsets.all(20.0),
      children: [
        const Text(
          "About This App",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        const SizedBox(height: 20),
        const Text(
          "This app is designed to help travelers learn about major tourist cities. "
          "It provides city facts, descriptions, and links to tourism agencies for planning trips. "
          "Users can interact by visiting tourism agencies websites after entering their profile details. "
          "websites after entering their profile details. "
          "Copyright © 2024 Ducane Talha Karaburun",
          style: TextStyle(fontSize: 16),
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
        "New York is one of the most iconic cities in the world, known for its diversity, culture, and landmarks.",
        "https://www.nycgo.com", // Link to tourism agency
      ),
      cityTab(
        "Los Angeles",
        'assets/losangeles.jpg',
        [
          "Population: 4 million",
          "Known for Hollywood",
          "Has great beaches",
          "Map of GTA 5"
        ],
        "Los Angeles is known for its Mediterranean climate, ethnic diversity, and the entertainment industry.",
        "https://www.discoverlosangeles.com", // Link to tourism agency
      ),
      cityTab(
        "Chicago",
        'assets/chicago.jpg',
        [
          "Population: 2.7 million",
          "Known for its deep-dish pizza",
          "Home to the Willis Tower",
          "Map of Watch Dogs"
        ],
        "Chicago is known for its magnificent architecture and vibrant cultural scene.",
        "https://www.choosechicago.com", // Link to tourism agency
      ),
      cityTab(
        "Houston",
        'assets/houston.jpg',
        [
          "Population: 2.3 million",
          "Known for NASA's Space Center",
          "Famous for its energy industry",
          "Tesla headquarters is here"
        ],
        "Houston is a major hub for the energy industry and is home to NASA's Johnson Space Center.",
        "https://www.visithoustontexas.com", // Link to tourism agency
      ),
      aboutPage(), // The about page content
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
              borderRadius: BorderRadius.circular(4),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "T R A V E L P E D I A",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                if (_username.isNotEmpty && _surname.isNotEmpty)
                  Text(
                    "$_username $_surname",
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
              ],
            ),
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
          ListTile(
            title: const Text("About"),
            onTap: () {
              Navigator.pop(context);
              _tabController.index = 4;
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
        BottomNavigationBarItem(
            icon: Icon(Icons.info_outline, color: Colors.black),
            label: "About",
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

// A simple web view to navigate to tourism agency links
class TourismWebView extends StatelessWidget {
  final String url;
  const TourismWebView({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tourism Agency Website"),
      ),
      body: Center(
        child: Text("Redirecting to $url..."),
      ),
    );
  }
}
