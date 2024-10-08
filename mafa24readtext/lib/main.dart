import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  Widget getTextFile() {
    return FutureBuilder(
        future: DefaultAssetBundle.of(context)
            .loadString("assets/weshallfight_short.txt"),
        builder: (context, snapshot) {
          return Text(snapshot.data ?? '', softWrap: true);
        });
  }

  Widget getRichTextFile() {
    TextStyle myTextStyle = const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
        fontFamily: "Courier New",
        color: Colors.indigo);

    return FutureBuilder(
        future: DefaultAssetBundle.of(context)
            .loadString("assets/weshallfight_short.txt"),
        builder: (context, snapshot) {
          return RichText(
              text: TextSpan(text: snapshot.data ?? '', style: myTextStyle));
        });
  }

  @override
  Widget build(BuildContext context) {
    const String speechTitle = "Winston Churchill Speech";
    TextStyle myTextStyle =
    const TextStyle(fontWeight: FontWeight.bold, fontSize: 24);

    return Scaffold(
        appBar: AppBar(
            title:
            const Text("Read Text File", style: TextStyle(fontSize: 36))),
        body: ListView(padding: const EdgeInsets.all(20.0), children: [
          Text(speechTitle, style: myTextStyle),
          getTextFile(),
          const Divider(thickness: 10, height: 30),
          getRichTextFile()
        ]));
  }
} //end of class
