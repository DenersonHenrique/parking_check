import 'package:flutter/material.dart';

import '../../../shared/widgets/bottom_navibar_widget.dart';
import 'views/about/about_view.dart';
import 'views/car_spaces/car_spaces_view.dart';
import 'views/historic/historic_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  final _buildView = <Widget>[
    const CarSpacesView(),
    const HistoricView(),
    const AboutView(),
  ];

  int _currentView(int index) {
    setState(() => _currentIndex = index);
    _pageController.animateToPage(
      _currentIndex,
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
        onTabTapped: _currentView,
      ),
    );
  }
}
