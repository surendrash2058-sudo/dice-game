
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DiceGame(),
    );
  }
}

class DiceGame extends StatefulWidget {
  const DiceGame({super.key});

  @override
  State<DiceGame> createState() => _DiceGameState();
}

class _DiceGameState extends State<DiceGame> {
  int player1 = 1;
  int player2 = 2;
  String winner = '?';

  void rollDice() {
    setState(() {
      player1 = Random().nextInt(6) + 1;
      player2 = Random().nextInt(6) + 1;

      if (player1 > player2) {
        winner = 'Player 1';
      } else if (player2 > player1) {
        winner = 'Player 2';
      } else {
        winner = 'Draw!';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(197, 243, 120, 90),

      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 176, 233, 18),
        elevation: 5,
        shadowColor: Colors.orange,
        title: const Text(
          'Dice Game',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 231, 146, 248),
          ),
        ),
      ),

      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 42),

            Text(
              'Winner: $winner',
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w900,
                color: Color.fromARGB(255, 252, 251, 251),
              ),
            ),

            const SizedBox(height: 30),

            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Player 1',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    color: Color.fromARGB(255, 252, 139, 158),
                  ),
                ),
                Text(
                  'Player 2',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    color: Color.fromARGB(255, 82, 186, 218),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),

            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Image.asset(
                      'images/dice$player1.png',
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Image.asset(
                      'images/dice$player2.png',
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: rollDice,
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    const Color.fromARGB(255, 176, 233, 18),
                foregroundColor: Colors.deepOrange,
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 14,
                ),
                side: const BorderSide(
                  color: Color.fromARGB(255, 206, 124, 17),
                  width: 3,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'START',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
