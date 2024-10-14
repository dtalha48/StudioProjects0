import 'package:flutter/material.dart';

/*
Top tabs - tabview - need a tab controller
*/

void main() {
  runApp(const MaterialApp(home: MyHomePage()));
}



class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}):super(key: key);


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  /* ****** */
  TabController _tabController;

  String quote1 = "well, aint this place a geographical oddity. Two weeks from everywhere!" 
  "we are two weeks from everywhere. Aint that something?";
  
  String quote2 = "the ebb and flow of the atlantic tides, the drift of the continents, the very position of the sun along its ecliptic. These are just a few of the things that I control in my world.";

  String quote3 = "it is a hundred and six miles to chicago, we have a full tank of gas, half a pack of cigarettes, its dark and we are wearing sunglasses.";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

      ),
      body:
    );
  }
}
