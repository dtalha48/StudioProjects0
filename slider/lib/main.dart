import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(home: myApp()));
}

class myApp extends StatefulWidget {
  @override
  _myAppState createState() => _myAppState();
}

class _myAppState extends State<myApp> {
  double value1 = 0;
  double value2 = 0;
  double value3 = 0;

  double _currentSliderValue1 = 0;
  double _currentSliderValue2 = 0;
  double _currentSliderValue3 = 0;

  Widget mySlider1() {
    return Slider(
      activeColor: Colors.amber,
      inactiveColor: Colors.indigo[800],
      max: 50,
      min: 0,
      value: _currentSliderValue1,
      onChanged: (double value) {
        setState(() {
          value1 = value.roundToDouble();
          _currentSliderValue1 = value.roundToDouble();
        });
      },
    );
  }

  Widget mySlider2() {
    return Slider(
      activeColor: Colors.amber,
      inactiveColor: Colors.green[800],
      max: 50,
      min: 0,
      value: _currentSliderValue2,
      label: _currentSliderValue2.roundToDouble().toString(),
      divisions: 10,
      onChanged: (double value) {
        setState(() {
          value2 = value.roundToDouble();
          _currentSliderValue2 = value.roundToDouble();
        });
      },
    );
  }

  Widget mySlider3() {
    return Slider(
      activeColor: Colors.amber,
      inactiveColor: Colors.blue[800],
      max: 360,
      min: 0,
      value: _currentSliderValue3,
      onChanged: (double value) {
        setState(() {
          value3 = value.roundToDouble();
          _currentSliderValue3 = value.roundToDouble();
        });
      },
    );
  }

  Widget myRotate() {
    return Align(
      alignment: Alignment.center,
      child: Transform.rotate(
        angle: _currentSliderValue3 * (pi / 180),
        child: SizedBox(
          height: 100,
          width: 100,
          child: Container(
            color: Colors.indigo,
            child: const Center(
              child: Text(
                "Bubba",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sliders")),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text("Slider Examples", style: TextStyle(fontSize: 24)),
          mySlider1(),
          Text(value1.toString()),
          mySlider2(),
          Text(value2.toString()),
          mySlider3(),
          Text(value3.toString()),
          myRotate(),
        ],
      ),
    );
  }
}
