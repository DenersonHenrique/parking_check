import 'package:flutter/material.dart';

class BottomNavibarWidget extends StatelessWidget {
  final int currentIndex;
  final void Function(int) onTabTapped;

  const BottomNavibarWidget({
    super.key,
    required this.currentIndex,
    required this.onTabTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTabTapped,
      selectedFontSize: 15,
      unselectedFontSize: 15,
      selectedItemColor: Colors.black,
      backgroundColor: Colors.green[50],
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.car_repair,
            size: 35,
          ),
          label: 'Vagas',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.history,
            size: 35,
          ),
          label: 'Histórico',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.info_outline,
            size: 35,
          ),
          label: 'Sobre',
        ),
      ],
    );
  }
}
