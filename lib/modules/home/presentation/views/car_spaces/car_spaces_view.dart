import 'package:flutter/material.dart';

import '../../widgets/car_spaces_grid_view_dart.dart';

class CarSpacesView extends StatelessWidget {
  const CarSpacesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const CarSpacesGridWidget(
        spacesList: [
          'Vaga1',
          'Vaga2',
          'Vaga3',
          'Vaga4',
          'Vaga4',
          'Vaga4',
          'Vaga4',
          'Vaga4',
          'Vaga4',
          'Vaga4',
          'Vaga4',
          'Vaga4',
          'Vaga4',
          'Vaga4',
          'Vaga4',
        ],
      ),
    );
  }
}
