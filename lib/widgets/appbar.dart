import 'package:flutter/material.dart';

AppBar monAppBar(String title)=> AppBar(
    elevation: 16,
    backgroundColor: Colors.blue,
    foregroundColor: Colors.white,
    title: Text(title),
    centerTitle: true,
    titleTextStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
  );


