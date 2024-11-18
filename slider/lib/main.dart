import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(home: StartPage(), debugShowCheckedModeBanner: false));
}

// Start Page with radio buttons to navigate
class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  int selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Start Page")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text("Select a Page", style: TextStyle(fontSize: 24)),
          ),
          RadioListTile<int>(
            title: const Text("Text Display Page"),
            value: 1,
            groupValue: selectedPage,
            onChanged: (value) {
              setState(() {
                selectedPage = value!;
                Navigator.push(context, MaterialPageRoute(builder: (_) => TextDisplayPage()));
              });
            },
          ),
          RadioListTile<int>(
            title: const Text("Tilt Image"),
            value: 2,
            groupValue: selectedPage,
            onChanged: (value) {
              setState(() {
                selectedPage = value!;
                Navigator.push(context, MaterialPageRoute(builder: (_) => TiltImagePage()));
              });
            },
          ),
          RadioListTile<int>(
            title: const Text("Scale Widget"),
            value: 3,
            groupValue: selectedPage,
            onChanged: (value) {
              setState(() {
                selectedPage = value!;
                Navigator.push(context, MaterialPageRoute(builder: (_) => ScaleWidgetPage()));
              });
            },
          ),
          RadioListTile<int>(
            title: const Text("Move Widget"),
            value: 4,
            groupValue: selectedPage,
            onChanged: (value) {
              setState(() {
                selectedPage = value!;
                Navigator.push(context, MaterialPageRoute(builder: (_) => MoveWidgetPage()));
              });
            },
          ),
        ],
      ),
    );
  }
}

// Page to display hardcoded text content
class TextDisplayPage extends StatelessWidget {
  final String content = "hihihihihihihihhih hohohohhohohoh ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Text Display")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(content, style: const TextStyle(fontSize: 18)),
      ),
    );
  }
}

// Page to tilt an image left or right using a slider
class TiltImagePage extends StatefulWidget {
  @override
  _TiltImagePageState createState() => _TiltImagePageState();
}

class _TiltImagePageState extends State<TiltImagePage> {
  double _tiltValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tilt Image")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Transform.rotate(
            angle: _tiltValue * (pi / 180),
            child: Image.asset('assets/sample_image.png', height: 200),
          ),
          const SizedBox(height: 20),
          Slider(
            min: -45,
            max: 45,
            value: _tiltValue,
            onChanged: (value) {
              setState(() {
                _tiltValue = value;
              });
            },
          ),
          Text("Tilt Angle: ${_tiltValue.toStringAsFixed(1)}°"),
        ],
      ),
    );
  }
}

// Page to scale a widget using a slider
class ScaleWidgetPage extends StatefulWidget {
  @override
  _ScaleWidgetPageState createState() => _ScaleWidgetPageState();
}

class _ScaleWidgetPageState extends State<ScaleWidgetPage> {
  double _scaleValue = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Scale Widget")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Transform.scale(
            scale: _scaleValue,
            child: Container(
              padding: const EdgeInsets.all(20),
              color: Colors.blue,
              child: const Text("Scalable Widget", style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
          ),
          const SizedBox(height: 20),
          Slider(
            min: 0.5,
            max: 2.0,
            value: _scaleValue,
            onChanged: (value) {
              setState(() {
                _scaleValue = value;
              });
            },
          ),
          Text("Scale Factor: ${_scaleValue.toStringAsFixed(2)}"),
        ],
      ),
    );
  }
}

// Page to move a widget across the page with a slider
class MoveWidgetPage extends StatefulWidget {
  @override
  _MoveWidgetPageState createState() => _MoveWidgetPageState();
}

class _MoveWidgetPageState extends State<MoveWidgetPage> {
  double _moveValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Move Widget")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Transform.translate(
            offset: Offset(_moveValue, 0),
            child: Container(
              padding: const EdgeInsets.all(20),
              color: Colors.green,
              child: const Text("Movable Widget", style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
          ),
          const SizedBox(height: 20),
          Slider(
            min: -100,
            max: 100,
            value: _moveValue,
            onChanged: (value) {
              setState(() {
                _moveValue = value;
              });
            },
          ),
          Text("Move Offset: ${_moveValue.toStringAsFixed(1)}"),
        ],
      ),
    );
  }
}
