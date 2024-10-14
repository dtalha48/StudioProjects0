import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedIndex = 0;

  static const TextStyle myStyle =
  TextStyle(fontSize: 36, fontWeight: FontWeight.bold);

  final  List<Widget> _WidgetOptions = [
  const Text('Index 0: People', style: myStyle),
  const Text('Index 1: Weekend', style: myStyle),
  const Text('Index 2: Message', style: myStyle),
  myWidget
  ];

  static List cities = [
  "New York",
  "Los Angeles",
  "Chicago",
  "Miami",
  "Dallas",
  "Houston",
  "Philadelphia",
  "Atlanta",
  "Washington",
  "Boston",
  "Phoenix",
  "Detroit",
  "San Francisco",
  "Seattle",
  "San Diego",
  "Minneapolis",
  "Metropolis",
  "Tampa",
  "Brooklyn",
  "Denver",
  "Queens",
  "Baltimore",
  "Las Vegas",
  "St. Louis",
  "Riverside",
  "Portland",
  "San Antonio",
  "Sacramento",
  "San Juan",
  "San Jose",
  "Orlando",
  "Cleveland",
  "Pittsburgh",
  "Manhattan",
  "Austin",
  "Cincinnati",
  "Indianapolis",
  "Kansas City",
  "Columbus",
  "Charlotte",
  "Virginia Beach",
  "Bronx",
  "Milwaukee",
  "Providence",
  "Jacksonville",
  "Salt Lake City",
  "Nashville",
  "Raleigh",
  "Memphis",
  "Richmond",
  "Louisville"
  ];

  // create our custom widget
  static Widget myWidget = Scrollbar(
  thickness: 10.0,
  // thumbvisilibilty set to true
  // it will always show the scrollbar
  thumbVisibility: true,
  radius: const Radius.circular(10),
  child: ListView.builder(
  primary: true,
  itemCount: 51,
  itemBuilder: (BuildContext context, int index) {
  return Container(
  height: 50,
  color: index.isEven ? Colors.black26 : Colors.grey[200],
  child: Padding(
  padding: const EdgeInsets.all(10),
  child: Text('City: ' + cities[index],
  style: TextStyle(color: Colors.indigo[800]))));
  }));

  void onItemTapped(int index) {
  setState(() {
  selectedIndex = index;
  });
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
  appBar: AppBar(title: const Text("Bottom Nav")),
  body: Center(child: _WidgetOptions.elementAt(selectedIndex)),
  bottomNavigationBar: BottomNavigationBar(
  items: const [
  BottomNavigationBarItem(
  icon: Icon(Icons.people),
  label: 'People',
  backgroundColor: Colors.blueGrey),
  BottomNavigationBarItem(
  icon: Icon(Icons.weekend),
  label: 'WeeekWend',
  backgroundColor: Colors.green),
  BottomNavigationBarItem(
  icon: Icon(Icons.message),
  label: 'Message',
  backgroundColor: Colors.indigo),
  BottomNavigationBarItem(
  icon: Icon(Icons.location_city),
  label: 'Cities',
  backgroundColor: Colors.teal),
  ],
  currentIndex: selectedIndex,
  selectedItemColor: Colors.amber[800],
  onTap: onItemTapped),
  );
  }
}

// Robert are you on zoom?