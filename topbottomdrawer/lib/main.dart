import 'package:flutter/material.dart';
// Top Bottom Drawer

// IN PRODUCTION  THE FOLLOW CODE CAN BE PUT IN A SEPARATE FILE
// DRAWER CODE  - BE USED MULIPLE PAGES

// =============================================================

void main() {
  runApp(MaterialApp(
      home: const MyApp(),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        "/HomePage": (BuildContext context) => const MyApp()
      }));
}

class MyApp extends StatefulWidget {
  // constructor
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late int _selectedIndex = 0;

  Drawer myDrawer(BuildContext context) {
    return Drawer(
        child: ListView(
            padding: const EdgeInsets.fromLTRB(5, 45, 5, 5),
            children: [
          SizedBox(
            height: 100,
            child: DrawerHeader(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.blue),
                child: const Text("States")),
          ),
          ListTile(
              title: const Text("Montana"),
              onTap: () {
                _onBottomTap(0);
              }),
          ListTile(
              title: const Text("Colorado"),
              onTap: () {
                _onBottomTap(1);
              }),
          ListTile(
              title: const Text("Wyoming"),
              onTap: () {
                _onBottomTap(2);
              }),
        ]));
  }

// tab contents
  String montanaCities = """
Here are 5 Monatana cites.
1. Helena
2. Kalispell
3. Whitefish
4. Missoula
5. Bozeman
""";

  String coloradoCities = """
Here are 5 Colorado cites.
1. Denver
2. Boulder
3. Pueblo
4. Aspen
5. Telluride
""";

  String wyomingCities = """
Here are 5 Wyoming cites.
1. Cheynne
2. Casper
3. Gillette
4. Laramie
5. Rock Springs
""";

  List<Tab> topTabs = <Tab>[
    const Tab(text: "Montana"),
    const Tab(text: "Colorado"),
    const Tab(text: "Wyoming"),
  ];

  Widget myTab1() {
    return ListView(
      padding: const EdgeInsets.all(20.0),
      children: [Text(montanaCities)],
    );
  }

  Widget myTab2() {
    return ListView(
      padding: const EdgeInsets.all(20.0),
      children: [Text(coloradoCities)],
    );
  }

  Widget myTab3() {
    return ListView(
      padding: const EdgeInsets.all(20.0),
      children: [Text(wyomingCities)],
    );
  }

  List<Widget> myContentWidgets(BuildContext context) {
    return <Widget>[myTab1(), myTab2(), myTab3()];
  }

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

  void _onBottomTap(int index) {
    setState(() {
      _selectedIndex = index;
      _tabController.index = index;
    });
  }

  BottomNavigationBar myBottomNavBar() {
    return BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
        onTap: _onBottomTap,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.android), label: "Montana"),
          BottomNavigationBarItem(icon: Icon(Icons.android), label: "Colorado"),
          BottomNavigationBarItem(icon: Icon(Icons.android), label: "Wyoming"),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Top Bottom Drawer Nav"),
        bottom: TabBar(
            controller: _tabController,
            tabs: topTabs,
            indicatorColor: Colors.amber[800],
            onTap: _onBottomTap),
      ),
      drawer: myDrawer(context),
      body: TabBarView(
          controller: _tabController, children: myContentWidgets(context)),
      bottomNavigationBar: myBottomNavBar(),
    );
  }
}
