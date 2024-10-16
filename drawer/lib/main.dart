// DRAWER APP

import 'package:flutter/material.dart';

// IN PRODUCTION  THE FOLLOW CODE CAN BE PUT IN A SEPARATE FILE
// DRAWER CODE  - BE USED MULIPLE PAGES

Drawer myDrawer(BuildContext context) {
  return Drawer(
      child: ListView(padding: EdgeInsets.zero, children: [
    DrawerHeader(
        decoration: BoxDecoration(
            image: const DecorationImage(
                image: AssetImage("assets/fvcc111.jpg"), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(40),
            color: Colors.yellow[800]),
        child: const Text("DrawerTitle")),
    ListTile(
        title: const Text("Home Page"),
        onTap: () {
          Navigator.of(context).pushNamed("/HomePage");
        }),
    ListTile(
        title: const Text("Page 1"),
        onTap: () {
          Navigator.of(context).pushNamed("/Page1");
        }),
    ListTile(
        title: const Text("Page 2"),
        onTap: () {
          Navigator.of(context).pushNamed("/Page2");
        }),
  ]));
}

// =============================================================
