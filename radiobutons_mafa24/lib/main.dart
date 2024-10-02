import 'package:flutter/material.dart';

String larryphoto = "images/larry.jpg";
String curlyphoto = "images/curly.jpg";
String moephoto = "images/moe.jpg";
String shempphoto = "images/shemp.jpg";

void main() {
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //Default values for our groups
  String _groupValue1 = "Larry";
  int _groupValue2 = 0;
  int _groupValue3 = 0;

  String larry = "Larry";
  String curly = "Curly";
  String moe = "Moe";
  String shemp = "Shemp";

  String selectStooge = "images/larry.jpg";
  String selectStooge2 = "images/larry.jpg";

  TextEditingController text1Controller = TextEditingController();

  // Create the textbox
  Widget makeTextBox() {
    return Container(
        padding: const EdgeInsets.all(20.0),
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Item Selected",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            TextField(
              controller: text1Controller,
              onChanged: _setTextField,
            )
          ],
        ));
  }

  void _setTextField(String value) {
    setState(() {
      text1Controller.text = value.toString();
    });
  }

  // --------- Make first set of radio buttons -------

  Widget makeRadioButtons1() {
    return Row(children: [
      Column(children: [
        Row(children: [
          const Text("Larry", style: TextStyle(fontSize: 18)),
          Radio(
            value: larry,
            groupValue: _groupValue1,
            autofocus: true,
            onChanged: (value) {
              setState(() {
                _groupValue1 = larry;
                text1Controller.text = value.toString();
                selectStooge = larryphoto;
              });
            },
          )
        ]),
        Row(children: [
          const Text("Curly", style: TextStyle(fontSize: 18)),
          Radio(
            value: curly,
            groupValue: _groupValue1,
            onChanged: (value) {
              setState(() {
                _groupValue1 = curly;
                text1Controller.text = value.toString();
                selectStooge = curlyphoto;
              });
            },
          )
        ]),
        Row(children: [
          const Text("Moe", style: TextStyle(fontSize: 18)),
          Radio(
            value: moe,
            groupValue: _groupValue1,
            onChanged: (value) {
              setState(() {
                _groupValue1 = moe;
                text1Controller.text = value.toString();
                selectStooge = moephoto;
              });
            },
          )
        ]),
      ]),
      Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
              child: Image.asset(selectStooge, width: 100, fit: BoxFit.cover)))
    ]);
  }

  // ------------------Radio Buttons -----------------

  Widget makeRadioButtons2() {
    List<Widget> list = <Widget>[];

    var StoogeList = ["Larry", "Curly", "Moe", "Shemp"];

    for (int i = 0; i < StoogeList.length; i++) {
      list.add(SizedBox(
          width: 150,
          height: 50,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(StoogeList[i].toString(),
                    style: TextStyle(fontSize: 18.0)),
                Radio(
                  value: i,
                  groupValue: _groupValue2,
                  onChanged: (value) {
                    setState(() {
                      _groupValue2 = i;

                      if (value == 0) {
                        selectStooge2 = larryphoto;
                      } else if (value == 1) {
                        selectStooge2 = curlyphoto;
                      } else if (value == 2) {
                        selectStooge2 = moephoto;
                      } else if (value == 3) {
                        selectStooge2 = shempphoto;
                      }

                      text1Controller.text = value.toString();
                    });
                  },
                )
              ])));
    } // end of four statement

    Column myColumn = Column(
      children: list,
    );

    Row myRow = Row(children: [
      myColumn,
      Image.asset(selectStooge2, width: 150, fit: BoxFit.cover)
    ]);

    return myRow;
  }

  // --------------------Radio Button Tiles------------------

  Widget makeRadioTiles() {
    List aNames = ["Bob", "Betty", "Beau", "Brian"];
    List jTitles = ["Doctor", "Enigneer", "Barber", "Developer"];

    List<Widget> list = <Widget>[];

    for (int i = 0; i < aNames.length; i++) {
      list.add(RadioListTile(
          value: i,
          groupValue: _groupValue3,
          activeColor: Colors.green,
          title: Text('Name: ' + aNames[i]),
          subtitle: Text('Job: ' + jTitles[i]),
          controlAffinity: ListTileControlAffinity.trailing,
          onChanged: (value) {
            setState(() {
              _groupValue3 = i;
              text1Controller.text =
                  aNames[i].toString() + " - " + jTitles[i].toString();
            });
          }));
    }

    Column mycolumn = Column(children: list);

    return mycolumn;
  }

  // -------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Radio Buttons")),
        body: ListView(
          padding: const EdgeInsets.all(20.0),
          children: [
            makeTextBox(),
            makeRadioButtons1(),
            const Divider(height: 20, thickness: 5, color: Colors.indigo),
            makeRadioButtons2(),
            const Divider(height: 20, thickness: 5, color: Colors.indigo),
            makeRadioTiles()
          ],
        ));
  }
}
