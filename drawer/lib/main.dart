// DRAWER APP

import 'package:flutter/material.dart';

// IN PRODUCTION  THE FOLLOW CODE CAN BE PUT IN A SEPARATE FILE
// DRAWER CODE  - BE USED MULIPLE PAGES

Drawer myDrawer(BuildContext context) {
  return Drawer(
      child: ListView(
    padding: EdgeInsets.zero,
    children: [
      DrawerHeader(
        asset: AssetImage('assets/fvcc111.jpg'),
        child: Text('Drawer Header'),
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
      ),
    ],
  ));
}

// =============================================================
