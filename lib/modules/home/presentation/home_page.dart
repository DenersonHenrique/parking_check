import 'package:flutter/material.dart';

import '../../../shared/widgets/bottom_navibar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  final _buildView = <Widget>[
    Container(
      color: Colors.red,
      child: const Center(
        child: Text('Vagas'),
      ),
    ),
    Container(
      color: Colors.green,
      child: const Center(
        child: Text('Histórico'),
      ),
    ),
    Container(
      color: Colors.blue,
      child: const Center(
        child: Text('Sobre'),
      ),
    ),
  ];

  int _currentView(int index) {
    setState(() => _currentIndex = index);
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
    return _currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu estacionamento'),
        centerTitle: true,
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: _currentView,
        children: _buildView,
      ),
      bottomNavigationBar: BottomNavibarWidget(
        currentIndex: _currentIndex,
        onTabTapped: (index) => _currentView(index),
      ),
    );
  }
}
