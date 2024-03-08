import 'package:flutter/material.dart';

import '../../../commons/helpers/presentation/mvvm/mvvm.dart';
import '../../../shared/widgets/bottom_navibar_widget.dart';
import '../../../shared/widgets/configure_spaces_widget.dart';
import 'home_viewmodel.dart';
import 'views/about/about_view.dart';
import 'views/car_spaces/car_spaces_view.dart';
import 'views/historic/historic_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends ViewState<HomePage, HomeViewModel> {
  int _currentIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

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
      body: ViewModelBuilder(
        viewModel: viewModel,
        builder: (context, state) {
          return PageView(
            controller: _pageController,
            onPageChanged: _currentView,
            children: <Widget>[
              viewModel.state.spaceList.isNotEmpty
                  ? CarSpacesView(
                      spacesList: viewModel.state.spaceList,
                    )
                  : Container(
                      color: Colors.white,
                      child: Center(
                        child: ConfigSpacesWidget(
                          onButtonSave: viewModel.saveSpaces,
                        ),
                      ),
                    ),
              const HistoricView(),
              const AboutView(),
            ],
          );
        },
      ),
      bottomNavigationBar: BottomNavibarWidget(
        currentIndex: _currentIndex,
        onTabTapped: _currentView,
      ),
    );
  }
}
