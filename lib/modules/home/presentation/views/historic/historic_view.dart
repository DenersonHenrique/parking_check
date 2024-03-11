import 'package:flutter/material.dart';

import '../../../domain/entities/car_space_entity.dart';
import 'widgets/historic_timeline_widget.dart';

class HistoricView extends StatelessWidget {
  final List<CarSpaceEntity> spaceList;

  const HistoricView({
    super.key,
    required this.spaceList,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: VerticalTimelineWidget(
        spaceList: spaceList,
      ),
    );
  }
}
