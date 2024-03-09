import 'package:flutter/material.dart';

import '../../../../domain/entities/car_space_entity.dart';
import 'car_space_form_widget.dart';
import 'car_space_item_widget.dart';

class CarSpacesGridWidget extends StatefulWidget {
  final List<CarSpaceEntity> spacesList;

  const CarSpacesGridWidget({
    super.key,
    required this.spacesList,
  });

  @override
  State<CarSpacesGridWidget> createState() => _CarSpacesGridWidgetState();
}

class _CarSpacesGridWidgetState extends State<CarSpacesGridWidget> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      key: const Key('spaces_grid'),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 6.0,
        mainAxisSpacing: 6.0,
      ),
      itemCount: widget.spacesList.length,
      itemBuilder: (context, index) {
        final space = widget.spacesList[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            child: CarSpaceItemWidget(
              space: space,
            ),
            onTap: () => _openModalForm(context, space),
          ),
        );
      },
    );
  }

  _openModalForm(BuildContext context, CarSpaceEntity space) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return SpaceFormWidget(
          space: space,
          onSubmit: _updateSpace,
        );
      },
    );
  }

  _updateSpace(CarSpaceEntity space) {
    int index =
        widget.spacesList.indexWhere((element) => element.id == space.id);

    if (index != -1) {
      setState(() {
        widget.spacesList[index] = space;
      });
    }
  }
}
