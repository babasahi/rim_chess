import 'package:flutter/material.dart';
import 'package:rim_chess/constants.dart';
import 'package:rim_chess/views/screens/game_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    CircleAvatar(
                      radius: 14,
                      backgroundColor: kPrimaryColor,
                    )
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GameScreen(),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.deepPurpleAccent,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.deepPurpleAccent.shade400,
                            offset: const Offset(0, 6),
                            spreadRadius: BorderSide.strokeAlignInside,
                          ),
                          BoxShadow(
                            color: Colors.deepPurpleAccent.shade400,
                            offset: const Offset(0, 6),
                            spreadRadius: BorderSide.strokeAlignInside,
                          )
                        ]),
                    height: 38,
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: const Center(
                      child: Text(
                        'ابدا اللعب',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'DINNext',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
