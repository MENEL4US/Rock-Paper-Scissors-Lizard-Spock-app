// ignore_for_file: implementation_imports, prefer_const_constructors, unnecessary_import, avoid_unnecessary_containers, avoid_print, prefer_final_fields, unnecessary_this, prefer_interpolation_to_compose_strings

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
  List options = ["rock", "paper", "scissor", "lizard", "spock"];

  var wins = {
    "rock": ["lizard", "scissor"],
    "paper": ["rock", "spock"],
    "scissor": ["lizard", "paper"],
    "lizard": ["spock", "paper"],
    "spock": ["rock", "scissor"],
  };

  var results = {
    "rock": {
      "lizard": "Pedra esmaga Lagarto",
      "scissor": "Pedra amassa Tesoura",
    },
    "paper": {
      "rock": "Papel cobre Pedra",
      "spock": "Papel refuta Spock",
    },
    "scissor": {
      "paper": "Tesoura corta Papel",
      "lizard": "Tesoura decapita Lagarto",
    },
    "lizard": {
      "spock": "Lagarto envenena Spock",
      "paper": "Lagarto come Papel",
    },
    "spock": {
      "rock": "Spock vaporiza Pedra",
      "scissor": "Spock derrete Tesoura",
    },
  };

  String _message = "Escolha uma opção";
  String _imagePath = "images/default.png";
  String _result = "";
  int _vitorias = 0;
  int _derrotas = 0;
  int _empates = 0;

  void _reset() {
    setState(() {
      this._message = "Escolha uma opção";
      this._imagePath = "images/default.png";
      this._vitorias = 0;
      this._empates = 0;
      this._derrotas = 0;
      this._result = "";
    });
  }

  void _play(String choice) {
    int i = Random().nextInt(options.length);
    String computer = options[i];
    String newMessage = "";
    String newResult = "";

    int newVitorias = _vitorias;
    int newDerrotas = _derrotas;
    int newEmpates = _empates;

    if (choice == computer) {
      newEmpates++;
      newResult = "";
      newMessage = "Empatamos!";
    } else if (wins[choice]!.contains(computer)) {
      newVitorias++;
      newMessage = "Você venceu!";
      newResult = results[choice]![computer]!;
    } else {
      newMessage = "Você perdeu!";
      newResult = results[computer]![choice]!;
      newDerrotas++;
    }

    setState(() {
      this._message = newMessage;
      this._imagePath = "images/$computer.png";
      this._vitorias = newVitorias;
      this._empates = newEmpates;
      this._derrotas = newDerrotas;
      this._result = newResult;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        title: Text("Pedra, Papel, Tesoura, Lagarto ou Spock"),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 12,
                bottom: 12,
              ),
              child: Text(
                "Escolha do App",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Image.asset(
            //   _imagePath,
            //   height: 90,
            // ),
            GestureDetector(
              onTap: () => _reset(),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Image.asset(
                  _imagePath,
                  height: 90,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 12,
                bottom: 12,
              ),
              child: Text(
                _message,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 8,
                bottom: 8,
              ),
              child: Text(
                _result,
                style: TextStyle(
                  fontSize: 16,
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
                    padding: EdgeInsets.all(8),
                    child: Image.asset(
                      "images/rock.png",
                      height: 70,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => _play("paper"),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Image.asset(
                      "images/paper.png",
                      height: 70,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => _play("scissor"),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Image.asset(
                      "images/scissor.png",
                      height: 70,
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
                    padding: EdgeInsets.all(8),
                    child: Image.asset(
                      "images/lizard.png",
                      height: 70,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => _play("spock"),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Image.asset(
                      "images/spock.png",
                      height: 70,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 12,
                bottom: 8,
              ),
              child: Text(
                "Vitórias: " + _vitorias.toString(),
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: 8,
              ),
              child: Text(
                "Derrotas: " + _derrotas.toString(),
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(),
              child: Text(
                "Empates: " + _empates.toString(),
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
