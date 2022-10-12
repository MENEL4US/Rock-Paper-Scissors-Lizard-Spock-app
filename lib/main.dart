// ignore_for_file: unnecessary_import, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'pages/home.dart';

void main(List<String> args) {
  runApp(
    MaterialApp(
      title: "Pedra, Papel, Tesoura, Lagarto ou Spock",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}
