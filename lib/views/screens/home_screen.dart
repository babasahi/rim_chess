import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
            padding: screenPadding(context),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 22,
                          backgroundColor: kPrimaryColor,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'باب صالح',
                          style: kHeadingStyle,
                        )
                      ],
                    ),
                    Container(
                      width: screenWidth(context) * 0.25,
                      height: screenHeight(context) * 0.04,
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: kPrimaryColor),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Icon(
                              FontAwesomeIcons.sackDollar,
                              color: Colors.deepPurpleAccent,
                              size: 20,
                            ),
                            Text(
                              '48000',
                              style: kHeadingStyle.copyWith(
                                fontFamily: 'Poppins',
                                color: kPrimaryColor,
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight(context) * 0.1),
                Text(
                  'Best Game Ever Best Game Ever Best Game Ever Best Game Ever Best Game Ever Best Game EverBest Game Ever Best Game Ever Best Game EverBest Game Ever Best Game Ever Best Game EverBest Game Ever Best Game Ever Best Game EverBest Game Ever Best Game Ever Best Game Ever Best Game Ever Best Game Ever Best Game Ever Best Game Ever ',
                  style: kHeadingStyle,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight(context) * 0.2),
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
