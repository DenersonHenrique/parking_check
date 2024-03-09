import 'package:flutter/material.dart';

import '../../../domain/entities/car_space_entity.dart';
import 'widgets/car_spaces_grid_view_dart.dart';

class CarSpacesView extends StatelessWidget {
  final List<CarSpaceEntity> spacesList;

  const CarSpacesView({
    super.key,
    required this.spacesList,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: CarSpacesGridWidget(
        spacesList: spacesList,
      ),
    );
  }
}
