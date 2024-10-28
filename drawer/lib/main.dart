// DRAWER APP

import 'package:flutter/material.dart';

// IN PRODUCTION  THE FOLLOW CODE CAN BE PUT IN A SEPARATE FILE
// DRAWER CODE  - BE USED MULIPLE PAGES

Drawer myDrawer(BuildContext context) {
  return Drawer(
      child: ListView(padding: EdgeInsets.zero, children: [
    DrawerHeader(
        decoration: BoxDecoration(
            image: const DecorationImage(
                image: AssetImage("assets/fvcc111.jpg"), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(40),
            color: Colors.yellow[800]),
        child: const Text("DrawerTitle")),
    ListTile(
        title: const Text("Home Page"),
        onTap: () {
          Navigator.of(context).pushNamed("/HomePage");
        }),
    ListTile(
        title: const Text("Page 1"),
        onTap: () {
          Navigator.of(context).pushNamed("/Page1");
        }),
    ListTile(
        title: const Text("Page 2"),
        onTap: () {
          Navigator.of(context).pushNamed("/Page2");
        }),
  ]));
}

// =============================================================

void main() {
  runApp(MaterialApp(
      home: const MyApp(),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        "/HomePage": (BuildContext context) => const MyApp(),
        "/Page1": (BuildContext context) => const Page1(),
        "/Page2": (BuildContext context) => const Page2(),
      }));
}

class MyApp extends StatefulWidget {
  // constructor
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Drawer Example")),
        backgroundColor: Colors.white60,
        drawer: myDrawer(context),
        body: ListView(
            padding: const EdgeInsets.all(20.0),
            children: const [Text("Home Page\nThis is the homepage")]));
  }
}

class Page1 extends StatefulWidget {
  // constructor
  const Page1({super.key});

  @override
  Page1State createState() => Page1State();
}

class Page1State extends State<Page1> {
  String myString = "Have a great day\n";
  String myAppend = "Have a great day\n";

  @override
  Widget build(BuildContext context) {
    for (int c = 0; c < 55; c++) {
      myString += myAppend;
    }
    return Scaffold(
        appBar: AppBar(title: const Text("Drawer Example")),
        backgroundColor: Colors.white60,
        drawer: myDrawer(context),
        body: ListView(
            padding: const EdgeInsets.all(20.0),
            children: [const Text("Page1 Content"), Text(myString)]));
  }
}

class Page2 extends StatefulWidget {
  // constructor
  const Page2({super.key});

  @override
  Page2State createState() => Page2State();
}

class Page2State extends State<Page2> {
  String myString = "Have a super day\n";
  String myAppend = "Have a super day\n";

  @override
  Widget build(BuildContext context) {
    for (int c = 0; c < 155; c++) {
      myString += myAppend;
    }
    return Scaffold(
        appBar: AppBar(title: const Text("Drawer Example")),
        backgroundColor: Colors.white60,
        drawer: myDrawer(context),
        body: ListView(
            padding: const EdgeInsets.all(20.0),
            children: [const Text("Page2 Content"), Text(myString)]));
  }
}
