import 'package:flutter/material.dart';

import '../../domain/entities/car_space_entity.dart';
import 'car_space_item_widget.dart';

class CarSpacesGridWidget extends StatelessWidget {
  final List<CarSpaceEntity> spacesList;

  const CarSpacesGridWidget({
    super.key,
    required this.spacesList,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      key: const Key('spaces_grid'),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of columns in the grid
        crossAxisSpacing: 6.0, // Spacing between columns
        mainAxisSpacing: 6.0, // Spacing between rows
      ),
      itemCount: spacesList.length,
      itemBuilder: (context, index) {
        final space = spacesList[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: CarSpaceItemWidget(
            space: space.number!,
          ),
        );
      },
    );
  }
}
