import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Flutter Cars",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: const MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  static dynamic data;

  // run on start

  static Future getData() async {
    var url = Uri.parse("https://flutter.locusnoesis.com/carinfo.php");
    http.Response response = await http.post(url);

    data = await jsonDecode(response.body);

    return data;
  }

  Widget myWidget = FutureBuilder(
      future: getData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                      ListTile(
                          title: Text(
                              "${data[index]['year']} ${data[index]['make']}"),
                          subtitle: Text(
                              "${data[index]['model']} ${data[index]['body_styles']}"))
                    ]));
              });
        } // end of if

        return const Text("Getting Data - Please Waitaa");
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Flutter Cars"), centerTitle: true),
        body: Column(children: [
          Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(20),
              child: Text("Cars for Sale",
                  style: TextStyle(
                      color: Colors.indigo[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0),
                  textAlign: TextAlign.left)),
          Expanded(child: myWidget)
        ]));
  }
}
