import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rim_chess/constants.dart';
import 'package:rim_chess/views/screens/home_screen.dart';
import 'package:rim_chess/views/screens/live_games_screen.dart';
import 'package:rim_chess/views/screens/my_games_screen.dart';
import 'package:rim_chess/views/screens/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Widget> _screens = [
    const HomeScreen(),
    const LiveGamesScreen(),
    const MyGamesScreen(),
    const ProfileScreen(),
  ];
  final PageController _pageController = PageController(initialPage: 0);
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: kBackgroundColor,
        currentIndex: _index,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            _index = value;
          });
          _pageController.jumpToPage(
            value,
          );
        },
        items: [
          BottomNavigationBarItem(
            icon: Container(
              width: 38,
              height: 38,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: _index == 0 ? kPrimaryColor : kBackgroundColor,
                borderRadius: BorderRadius.circular(64),
              ),
              child: Center(
                child: Icon(
                  size: 20,
                  FontAwesomeIcons.house,
                  color: _index == 0 ? kBackgroundColor : kIconsColor,
                ),
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: 38,
              height: 38,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: _index == 1 ? kPrimaryColor : kBackgroundColor,
                borderRadius: BorderRadius.circular(64),
              ),
              child: Center(
                child: Icon(
                  size: 20,
                  FontAwesomeIcons.bomb,
                  color: _index == 1 ? kBackgroundColor : kIconsColor,
                ),
              ),
            ),
            label: 'orders',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: 38,
              height: 38,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: _index == 2 ? kPrimaryColor : kBackgroundColor,
                borderRadius: BorderRadius.circular(64),
              ),
              child: Center(
                child: Icon(
                  FontAwesomeIcons.list,
                  color: _index == 2 ? kBackgroundColor : kIconsColor,
                  size: 20,
                ),
              ),
            ),
            label: 'support',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: 38,
              height: 38,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: _index == 3 ? kPrimaryColor : kBackgroundColor,
                borderRadius: BorderRadius.circular(64),
              ),
              child: Center(
                child: Icon(
                  FontAwesomeIcons.user,
                  color: _index == 3 ? kBackgroundColor : kIconsColor,
                  size: 20,
                ),
              ),
            ),
            label: 'support',
          ),
        ],
      ),
    );
  }
}
