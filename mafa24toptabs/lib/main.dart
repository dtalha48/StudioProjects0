import 'package:flutter/material.dart';

/*
Top tabs - tabview - need a tab controller
*/

void main() {
  runApp(const MaterialApp(home: MyHomePage()));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  /* ****** */
  late TabController _tabController;

  String quote1 = "Well, aint' this place a geographical oddity. "
      "We are two weeks away from everywhere";

  String quote2 = "The ebb and flow of the Atlantic tides,"
      "the drift of the continents,"
      "the very position of sun along its eclipitic"
      "THESE are just a few the things"
      "I control in my world";

  String quote3 = "It's a hundred and six miles to Chicage"
      "we've got a full tank of gas"
      "half a pack cigarettes,"
      "its dar and we're sunglasses";

  final List<Tab> mytabs = <Tab>[
    const Tab(text: "Oh Brother"),
    const Tab(text: "GI Jane"),
    const Tab(text: "Blues Brother"),
  ];

  TextStyle myQuoteStyle =
      const TextStyle(fontSize: 36, fontFamily: 'PermanentMaker');

  // end of globals

  // setup tab controlleer
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: mytabs.length);
  }

  // if we have an init its good practice to have dispose
  // do it in the reverse order that we created it initState()

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  myTab1() {
    return ListView(
        padding: const EdgeInsets.all(20),
        children: [Text(quote1, style: myQuoteStyle)]);
  }

  myTab2() {
    return ListView(
        padding: const EdgeInsets.all(20),
        children: [Text(quote2, style: myQuoteStyle)]);
  }

  myTab3() {
    return ListView(
        padding: const EdgeInsets.all(20),
        children: [Text(quote3, style: myQuoteStyle)]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Tabs"),
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            bottom: TabBar(
                controller: _tabController,
                indicatorColor: Colors.amber,
                tabs: mytabs)),
        body: TabBarView(
            controller: _tabController,
            children: [myTab1(), myTab2(), myTab3()]));
  }
}
