import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MyStatelessWidget()));
}

class MyStatelessWidget extends StatelessWidget {
  // constructor
  const MyStatelessWidget({super.key});

  Widget gameTitles() {
    List<String> games = [
      "Ghost of Tushima",
      "Sifu",
      "Forza Forizon",
      "The Finals"
    ];


    return Column(children: [
      const Text("Games",
          style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold)),
      Text(games.elementAt(0),
          style: const TextStyle(fontSize: 24.0, fontStyle: FontStyle.italic)),
      Text(games.elementAt(1),
          style: const TextStyle(fontSize: 24.0, fontStyle: FontStyle.italic)),
      Text(games.elementAt(2),
          style: const TextStyle(fontSize: 24.0, fontStyle: FontStyle.italic)),
      Text(games.elementAt(3),
          style: const TextStyle(fontSize: 24.0, fontStyle: FontStyle.italic)),
      const Divider(color: Colors.red, thickness: 5, height: 50.0),
      const MyCard(title: Text("Ghost of Tushima"), genre: Text("action"))
    ]);
  }

  Widget myWidget() {
    return const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyCard(title: Text("Sifu "), genre: Text("action")),
          MyCard(title: Text("Sifu II"), genre: Text("action")),
          MyCard(title: Text("The Finals"), genre: Text("action")),
          MyCard(title: Text("Forza IV"), genre: Text("action")),
          MyCard(title: Text("Forza Horizon V"), genre: Text("Racing")),
          MyCard(title: Text("No Way Out"), genre: Text("action")),

        ]);
  }

  Widget rowExample() {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.movie, size: 50, color: Colors.red),
        Icon(Icons.tv, size: 50, color: Colors.lightBlue),
        Icon(Icons.music_note, size: 50, color: Colors.green),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    List<String> games = [];

    return Scaffold(
      appBar: AppBar(title: const Text("Home Page")),
      backgroundColor: Colors.amber,
      body: ListView(
        padding: const EdgeInsets.all(10.0),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              rowExample(),



              RichTextCard(), // RichTextCard added here

              const Divider(color: Colors.deepOrange), // Another divider added here
              myWidget(),
              gameTitles(),
              const Text("The End")
            ],
          ),
        ],
      ),
    );
  }
} // end class

class MyCard extends StatelessWidget {
  final Widget title;
  final Widget genre;

  // constructor
  const MyCard(
      {super.key, this.title = const Text(""), this.genre = const Text("")});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10.0),
        width: 500.0,
        child: Card(child: Column(children: [title, genre])));
  }
}

// New RichTextCard widget added
class RichTextCard extends StatelessWidget {
  const RichTextCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.lightBlue,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: RichText(
        text: const TextSpan(
          text: 'Welcome ',
          style: TextStyle(fontSize: 20.0, color: Colors.black),
          children: <TextSpan>[
            TextSpan(
                text: 'Bubba',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.pink)),
            TextSpan(text: ', Thanks for Using'),
          ],
        ),
      ),
    );
  }
}