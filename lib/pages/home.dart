// ignore_for_file: implementation_imports, prefer_const_constructors, unnecessary_import, avoid_unnecessary_containers, avoid_print, prefer_final_fields, unnecessary_this

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List options = ["rock", "paper", "scissors", "lizard", "spock"];

  var wins = {
    "rock": ["lizard", "scissors"],
    "paper": ["rock", "spock"],
    "scissors": ["lizard", "paper"],
    "lizard": ["spock", "paper"],
    "spock": ["rock", "scissors"],
  };

  String _message = "Escolha uma opção";
  String _imagePath = "images/default.png";

  void _play(String choice) {
    int i = Random().nextInt(options.length);
    String computer = options[i];
    String newMessage = "";

    if (choice == computer) {
      newMessage = "Empate!";
    } else if (wins[choice]!.contains(computer)) {
      newMessage = "Vitória! :D";
    } else {
      newMessage = "Derrota! :(";
    }

    setState(() {
      this._message = newMessage;
      this._imagePath = "images/$computer.png";
    });

    print("You: $choice, Computer: $computer $newMessage");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pedra, Papel, Tesoura, Lagarto ou Spock"),
      ),
      body: Container(
        // main
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 24,
                bottom: 24,
              ),
              child: Text(
                "Escolha do App",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Image.asset(
              _imagePath,
              height: 160,
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 24,
                bottom: 24,
              ),
              child: Text(
                _message,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => _play("rock"),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Image.asset(
                      "images/lizard.png",
                      height: 80,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => _play("paper"),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Image.asset(
                      "images/lizard.png",
                      height: 80,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => _play("scissors"),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Image.asset(
                      "images/lizard.png",
                      height: 80,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => _play("lizard"),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Image.asset(
                      "images/lizard.png",
                      height: 80,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => _play("spock"),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Image.asset(
                      "images/lizard.png",
                      height: 80,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
