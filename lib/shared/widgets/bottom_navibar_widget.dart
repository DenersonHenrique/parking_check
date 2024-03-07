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
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.car_repair),
          label: 'Vagas',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Histórico',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Sobre',
        ),
      ],
    );
  }
}
