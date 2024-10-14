import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        "/HomePage": (BuildContext context) => const HomePage(),
        "/SecondPage": (BuildContext context) => const SecondPage(),
        "/ThirdPage": (BuildContext context) => const ThirdPage(),
        "/FourthPage": (BuildContext context) => const FourthPage(),
      }));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Home Page"), backgroundColor: Colors.deepOrange),
        body: ListView(children: [
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
                padding: const EdgeInsets.all(40.0),
                color: Colors.tealAccent,
                alignment: Alignment.center,
                child: const Text("This is \nmytravel app\nPlease pay me",
                    style: TextStyle(fontSize: 36.0))),
            const Text("Content Here",
                style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold)),
            const Text("Content Here",
                style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold)),
            const Text("Content Here",
                style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    icon: const Icon(Icons.airplanemode_active,
                        color: Colors.red),
                    padding: EdgeInsets.zero,
                    iconSize: 70.0,
                    onPressed: () {
                      Navigator.of(context).pushNamed("/SecondPage");
                    }),
                IconButton(
                    icon: const Icon(Icons.train, color: Colors.red),
                    padding: EdgeInsets.zero,
                    iconSize: 70.0,
                    onPressed: () {
                      Navigator.of(context).pushNamed("/ThirdPage");
                    }),
                IconButton(
                    icon: const Icon(Icons.directions_car, color: Colors.red),
                    padding: EdgeInsets.zero,
                    iconSize: 70.0,
                    onPressed: () {
                      Navigator.of(context).pushNamed("/FourthPage");
                    }),
              ],
            )
          ]),
        ]));
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Plane Page"),
            backgroundColor: Colors.deepOrange),
        body: ListView(children: [
          Container(
              padding: const EdgeInsets.all(40.0),
              color: Colors.tealAccent,
              alignment: Alignment.center,
              child:
              const Text("Plane info", style: TextStyle(fontSize: 36.0))),
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text("Content Here",
                    style:
                    TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold)),
                const Text("Content Here",
                    style:
                    TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold)),
                IconButton(
                    icon: const Icon(Icons.home, color: Colors.red),
                    padding: EdgeInsets.zero,
                    iconSize: 70.0,
                    onPressed: () {
                      Navigator.of(context).pushNamed("/HomePage");
                    }),
              ])
        ]));
  }
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Train Page"),
            backgroundColor: Colors.deepOrange),
        body: ListView(children: [
          Container(
              padding: const EdgeInsets.all(40.0),
              color: Colors.tealAccent,
              alignment: Alignment.center,
              child:
              const Text("Train info", style: TextStyle(fontSize: 36.0))),
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text("Content Here",
                    style:
                    TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold)),
                const Text("Content Here",
                    style:
                    TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold)),
                IconButton(
                    icon: const Icon(Icons.home, color: Colors.red),
                    padding: EdgeInsets.zero,
                    iconSize: 70.0,
                    onPressed: () {
                      Navigator.of(context).pushNamed("/HomePage");
                    }),
              ])
        ]));
  }
}

class FourthPage extends StatelessWidget {
  const FourthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Automobile Page"),
            backgroundColor: Colors.deepOrange),
        body: ListView(children: [
          Container(
              padding: const EdgeInsets.all(40.0),
              color: Colors.tealAccent,
              alignment: Alignment.center,
              child: const Text("Car info", style: TextStyle(fontSize: 36.0))),
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text("Content Here",
                    style:
                    TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold)),
                const Text("Content Here",
                    style:
                    TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold)),
                IconButton(
                    icon: const Icon(Icons.home, color: Colors.red),
                    padding: EdgeInsets.zero,
                    iconSize: 70.0,
                    onPressed: () {
                      Navigator.of(context).pushNamed("/HomePage");
                    }),
              ])
        ]));
  }
}
