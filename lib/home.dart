import 'dart:async';
import 'package:flutter/material.dart';
import 'package:xo_game/Players.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool playerx = true;
  bool winner = false;
  int filled = 0;
  List<String> cells = List.filled(9, '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(

          padding: EdgeInsets.only(top: 70),
          child: Column(
            children: [
              const Center(
                child: Text(
                  "XO Game",
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text(
                    "Player 1",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Player 2",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              GridView.builder(
                shrinkWrap: true,
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      if (cells[index] == '' && !winner) {
                        setState(() {
                          cells[index] = playerx ? 'X' : 'O';
                          filled++;
                          checkwinner();
                          if (winner || filled == 9) {
                            Future.delayed(Duration(milliseconds: 500), resetGame);
                          } else {
                            playerx = !playerx;
                          }
                        });
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          cells[index],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 70,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: resetGame,
                child: const Text("Play Again"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void checkwinner() {
    List<List<int>> winningCombinations = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var combo in winningCombinations) {
      if (cells[combo[0]] == cells[combo[1]] &&
          cells[combo[0]] == cells[combo[2]] &&
          cells[combo[0]] != '') {
        setState(() {
          winner = true;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Player ${cells[combo[0]]} wins!")),
          );
        });
        return;
      }
    }

    if (filled == 9 && !winner) {
      setState(() {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Nobody wins!")),
        );
      });
    }
  }

  void resetGame() {
    setState(() {
      cells = List.filled(9, '');
      filled = 0;
      winner = false;
      playerx = true;
    });
  }
}
