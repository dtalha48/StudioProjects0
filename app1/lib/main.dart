import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MyStateLessWidget()));
}

class MyStateLessWidget extends StatelessWidget {
  //constructor
  const MyStateLessWidget({Key? key}) : super(key: key);

  static const String myName = "Dedective Catlover";

  @override
  Widget build(BuildContext context) {
    const String theTitle = "Cat Finder";

    return Scaffold(
        appBar: AppBar(
          title: const Text(theTitle),
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.amber,
        ),
        body: Container(
          padding: const EdgeInsets.fromLTRB(30, 100, 30, 50),
          width: MediaQuery.sizeOf(context).width,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Happy Day"),
              Text(
                "The Beatles",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold),
              ),
              Divider(
                color: Colors.green,
                thickness: 15,
                indent: 0,
                endIndent: 0,
              ),
              Text(myName),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyCard(
                      title: const Text("Guru"),
                      icon: Icon(Icons.airplane_ticket,
                          size: 40.0, color: Colors.blue),
                    ),
                    MyCard(
                      title: const Text("Boss"),
                      icon: Icon(Icons.cabin, size: 40.0, color: Colors.blue),
                    ),
                    MyCard(
                      title: const Text("Chif"),
                      icon: Icon(Icons.apple, size: 40.0, color: Colors.blue),
                    ),
                  ]),

              // Card(
              //     elevation: 5.0,
              //     child: Column(
              //       children: [
              //         Text("Oh Brother Where Art Thou"),
              //         Text("Momma says you ain't bonnafide!")
              //       ],
              //     )
              //     ),
              MyRichText.allInfo("Bubba", "Barnes", "Bloodhound", "Blue"),
              MyRichText.allInfo("James", "Jones", "Jojo", "Mutt"),
              MyRichText.allInfo("Greta", "Gable", "Gus", "German Shepard"),
              MyRichText.allInfo("Garret", "Green", "Grey", "Greyhound"),
            ],
          ),
        ));
  } //end of class MyStatelessWidget
}

class MyCard extends StatelessWidget {
  final Widget title;
  final Widget icon;

  // constructor
  const MyCard(
      {Key? key,
        this.title = const Text(""),
        this.icon = const Icon(Icons.camera)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10.0),
        child: Card(
            elevation: 5.0,
            child: Container(
                padding: const EdgeInsets.all(10.0),
                //width: MediaQuery.sizeOf(context).width,
                child: Column(
                  children: <Widget>[title, icon],
                ))));
  }
}

class MyRichText extends StatelessWidget {
  String _ownerFN = "";
  String _ownerLN = "";
  String _dogBreed = "";
  String _dogName = "Barky";

  // Constructor
  MyRichText.allInfo(
      this._ownerFN, this._ownerLN, this._dogBreed, this._dogName);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.yellow.shade600, width: 5.0),
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.lightBlueAccent,
      ),
      margin: const EdgeInsets.fromLTRB(50, 5, 0, 20),
      padding: const EdgeInsets.all(10.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            RichText(
                text: TextSpan(children: <TextSpan>[
                  const TextSpan(
                      text: 'Owner: ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                  TextSpan(text: _ownerFN + " " + _ownerLN)
                ])),
            RichText(
                text: TextSpan(children: <TextSpan>[
                  const TextSpan(
                      text: 'Dog Name:',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                  TextSpan(text: _dogName)
                ])),
            RichText(
                text: TextSpan(children: <TextSpan>[
                  const TextSpan(
                      text: 'Dog Breed: ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                  TextSpan(text: _dogBreed)
                ])),
          ]),
    ); // container
  }
}
