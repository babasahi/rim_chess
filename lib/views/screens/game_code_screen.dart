import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rim_chess/constants.dart';
import 'package:rim_chess/views/components/common_components.dart';

class GameCodeScreen extends StatefulWidget {
  const GameCodeScreen({super.key});

  @override
  State<GameCodeScreen> createState() => _GameCodeScreenState();
}

class _GameCodeScreenState extends State<GameCodeScreen> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: screenPadding(context),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'أدخل رمز اللعبة',
                  style: kHeadingStyle,
                ),
                SizedBox(height: screenHeight(context) * 0.03),
                AppTextField(
                  icon: const Icon(
                    FontAwesomeIcons.link,
                    color: kPrimaryColor,
                  ),
                  obscureText: false,
                  hintText: '',
                  controller: _controller,
                  trailingIcon: null,
                  trailingIconTapped: () {},
                  keyboardType: TextInputType.number,
                  textFieldWidth: screenWidth(context) * 0.8,
                  onChanged: () {
                    setState(() {});
                  },
                ),
                SizedBox(height: screenHeight(context) * 0.03),
                AppActionButton(
                  onTap: () {},
                  label: 'دخول',
                  icon: null,
                  activated: _controller.text.length == 4,
                  smallTitle: false,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
