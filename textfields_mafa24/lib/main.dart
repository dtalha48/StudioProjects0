import 'package:flutter/material.dart';

/*
  Textfields needs two things:
  1. Textfields need to connected to  a controller
  2. Values in the textfield can only be read or edited in
    setState() function is a stateful Widget
*/

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State {
  // these controlles need to be connected to the textfields
  TextEditingController tc1 = TextEditingController();
  TextEditingController tc2 = TextEditingController();

  // global variable
  String textValue = "";

  // listener function
  void onPressed() {
    // this is where we are going to change the state of the variable
    // textValue

    setState(() {
      textValue = "${tc1.text} ${tc2.text}";
    });
  }

  @override
  Widget build(BuildContext context) {
    double theBoxWidth = 120;
    double theBoxHeigth = 40;

    return Scaffold(
        appBar: AppBar(title: const Text("Text Box Example")),
        body: ListView(padding: const EdgeInsets.all(10.0), children: [
          Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              const Text("Box 1"),
              SizedBox(
                  width: theBoxWidth,
                  height: theBoxHeigth,
                  child: TextField(
                      controller: tc1, keyboardType: TextInputType.text))
            ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text("Box 2"),
                  SizedBox(
                      width: theBoxWidth,
                      height: theBoxHeigth,
                      child: TextField(
                          controller: tc2, keyboardType: TextInputType.text))
                ]),
            Text(textValue),
            ElevatedButton(onPressed: onPressed, child: const Text("Click Me"))
          ])
        ]));
  }
}
