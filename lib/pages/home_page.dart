// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_virtual_book_g5/pages/drawer/drawer_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        actions: [IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
              icon: Icon(Icons.output))],
      ),
      drawer: DrawerHome(),
      body: Container(),
      
    );
  }
}