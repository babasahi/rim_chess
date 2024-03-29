import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
            icon: CircleAvatar(
              backgroundColor: _index == 0 ? kPrimaryColor : kBackgroundColor,
              radius: 20,
              child: SvgPicture.asset(
                'assets/images/icons/home.svg',
                color: _index == 0 ? kBackgroundColor : kIconsColor,
                height: 20,
                width: 20,
              ),
            ),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundColor: _index == 1 ? kPrimaryColor : kBackgroundColor,
              radius: 20,
              child: SvgPicture.asset(
                'assets/images/icons/shop.svg',
                color: _index == 1 ? kBackgroundColor : kIconsColor,
                width: 21,
                height: 19,
              ),
            ),
            label: 'orders',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundColor: _index == 2 ? kPrimaryColor : kBackgroundColor,
              radius: 20,
              child: SvgPicture.asset(
                'assets/images/icons/calendar.svg',
                color: _index == 2 ? kBackgroundColor : kIconsColor,
                height: 22.25,
                width: 21,
              ),
            ),
            label: 'support',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundColor: _index == 3 ? kPrimaryColor : kBackgroundColor,
              radius: 20,
              child: SvgPicture.asset(
                'assets/images/icons/membership.svg',
                color: _index == 3 ? kBackgroundColor : kIconsColor,
                height: 25,
                width: 24,
              ),
            ),
            label: 'support',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundColor: _index == 4 ? kPrimaryColor : kBackgroundColor,
              radius: 20,
              child: SvgPicture.asset(
                'assets/images/icons/options.svg',
                color: _index == 4 ? kBackgroundColor : kIconsColor,
                width: 19.5,
                height: 15.5,
              ),
            ),
            label: 'support',
          ),
        ],
      ),
    );
  }
}
