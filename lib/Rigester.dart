import 'package:flutter/material.dart';
import 'package:xo_game/Players.dart';

class Register extends StatefulWidget {
  Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController player1 = TextEditingController();

  TextEditingController player2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 90),
        child: Column(children: [
          Text(
            "Enter players!",
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 40,
          ),
          TextFormField(
            controller: player1,
            maxLength: 1,
            decoration: InputDecoration(
              labelText: "Player 1",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: player2,
            maxLength: 1,
            decoration: InputDecoration(
              labelText: "Player 2",
              border: OutlineInputBorder(),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  Navigator.of(context).pushNamed("home");
                  Players(player1: player1.text, player2: player2.text);
                });
              },
              child: Text(
                "Start",
                style: TextStyle(fontSize: 27, color: Colors.white),
              ))
        ]),
      ),
    );
  }
}
