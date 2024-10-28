import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MyHomePage()));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static DateTime _date = DateTime.now();
  // static TimeOfDay _time = TimeOfDay.now();

  String myDate1 = "";
  String myDate2 = "";
  String myTime1 = "";

  Widget getDate() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        onPressed: () {
          setState(() {
            theDate();
          });
        },
        child: const Text("Select Date"));
  }

  theDate() async {
    _date = (await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000, 1, 1),
        lastDate: DateTime(3000, 1, 1)))!;

    // update the textfield
    setState(() {
      if (_date.toString() != "") {
        myDate1 = _date.month.toString() +
            " / " +
            _date.day.toString() +
            " / " +
            _date.year.toString();
      } else {
        myDate1 = "";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Date Pickers")),
        body: ListView(
            padding: const EdgeInsets.all(20.0),
            children:[
              Column( children:[
                const Text('Time / Date Picker',
                    style:TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                getDate(),
                Text(myDate1)
              ]
              )]
        ));
  }
}
