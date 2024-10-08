import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: const MyApp(), routes: <String, WidgetBuilder>{
    "/MyApp": (BuildContext context) => const MyApp(),
    "/PickStooge": (BuildContext context) => const PickStooge(),
    "/ThirdPage": (BuildContext context) => const ThirdPage()
  }));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Home Page")),
        body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            children: [
              Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("\nHome Page", style: TextStyle(fontWeight: FontWeight.w900)),
                        const Divider(
                          height: 20,
                          thickness: 5,
                          color: Colors.blueGrey,
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed("/PickStooge");
                            },
                            icon: const Icon(Icons.account_tree_rounded, color: Colors.indigo),
                            iconSize: 70.0)
                      ])),
            ]));
  }
}

class PickStooge extends StatefulWidget {
  const PickStooge({Key? key}) : super(key: key);

  @override
  _PickStooge createState() => _PickStooge();
}

class _PickStooge extends State {
  String myStooge = "Unity 1";
  var stoogeCounter = 0;
  Color stoogeColor = Colors.limeAccent;

  String larryPhoto = "images/larry.jpg";
  String curlyPhoto = "images/curly.jpg";
  String moePhoto = "images/moe.jpg";
  String selectStooge = "images/larry.jpg";

  Widget stoogePhoto(String selectStooge) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Image.asset(selectStooge,
            height: 400, width: 300, fit: BoxFit.cover));
  }

  void changeStooge() {
    stoogeCounter++;

    setState(() {
      if ((stoogeCounter % 3 == 0)) {
        myStooge = "Unity1";
        stoogeColor = Colors.blue;
        selectStooge = larryPhoto;
      } else if ((stoogeCounter % 3 == 1)) {
        myStooge = "Unity2";
        stoogeColor = Colors.green;
        selectStooge = curlyPhoto;
      } else if ((stoogeCounter % 3 == 2)) {
        myStooge = "Unity3";
        stoogeColor = Colors.limeAccent;
        selectStooge = moePhoto;
      }
    });
  }

  Widget goHome(BuildContext context) {
    return (Column(children: [
      IconButton(
          icon: const Icon(Icons.home_outlined, color: Colors.black),
          iconSize: 70.0,
          onPressed: () {
            Navigator.of(context).pushNamed("/MyApp");
          }),
      const Text(
        "Go To\nHome Page",
        textAlign: TextAlign.center,
      )
    ]));
  }

  Widget goThirdPage(BuildContext context) {
    return (Column(children: [
      IconButton(
          icon: const Icon(Icons.insert_emoticon_sharp, color: Colors.blueAccent),
          iconSize: 70.0,
          onPressed: () {
            Navigator.of(context).pushNamed("/ThirdPage");
          }),
      const Text(
        "Go To\nAbout Me",
        textAlign: TextAlign.center,
      )
    ]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Level Design Unity"),
        backgroundColor: Colors.limeAccent,
      ),
      body: ListView(children: [
        Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text("\nSome Screenshots", style: TextStyle(fontSize: 24.0)),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: stoogeColor,
                  textStyle: const TextStyle(color: Colors.blue)),
              onPressed: changeStooge,
              child: Text(myStooge)),
          stoogePhoto(selectStooge),
          const Divider(height: 20.0, thickness: 5.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [goHome(context), goThirdPage(context)],
          )
        ]),
      ]),
    );
  }
}

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  TextEditingController tc1 = TextEditingController();
  TextEditingController tc2 = TextEditingController();
  String textValue = "";

  void onPressed() {
    setState(() {
      textValue = "${tc1.text} ${tc2.text}";
    });
  }

  @override
  Widget build(BuildContext context) {
    double theBoxWidth = 120;
    double theBoxHeight = 40;

    return Scaffold(
      appBar: AppBar(
        title: const Text("About Me and Text Box Example"),
        backgroundColor: Colors.limeAccent,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text(
            "\nAbout me",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const Text(
            "\nDucane born in Fethiye, Ducane and his 2 friend studied at 3 diffrent high school to travel and explore other cities of turkey...",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Divider(height: 20.0, thickness: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(children: [
                const Text("Picture Number "),
                SizedBox(
                  width: theBoxWidth,
                  height: theBoxHeight,
                  child: TextField(controller: tc1),
                )
              ]),
              Column(children: [
                const Text("Rating"),
                SizedBox(
                  width: theBoxWidth,
                  height: theBoxHeight,
                  child: TextField(controller: tc2),
                )
              ]),
            ],
          ),
          Text(textValue),
          ElevatedButton(onPressed: onPressed, child: const Text("Click Me")),
          const Divider(height: 20.0, thickness: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.home_outlined, color: Colors.black),
                iconSize: 70.0,
                onPressed: () {
                  Navigator.of(context).pushNamed("/MyApp");
                },
              ),
              const Text(
                "Go To\nHome Page",
                textAlign: TextAlign.center,
              ),
              IconButton(
                icon: const Icon(Icons.photo_album_outlined, color: Colors.green),
                iconSize: 70.0,
                onPressed: () {
                  Navigator.of(context).pushNamed("/PickStooge");
                },
              ),
              const Text(
                "Go To\nPick A Stooge",
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
