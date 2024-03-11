import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../../../../commons/helpers/constants/consts_app.dart';
import '../../../../domain/entities/car_space_entity.dart';

class VerticalTimelineWidget extends StatelessWidget {
  final List<CarSpaceEntity> spaceList;

  const VerticalTimelineWidget({
    super.key,
    required this.spaceList,
  });

  List<CarSpaceEntity> _filterSpacesWithVehicle(List<CarSpaceEntity> spaces) {
    final list = spaces
        .where(
          (space) => space.vehicle != null && space.vehicle!.identifier != null,
        )
        .toList();
    return list;
  }

  @override
  Widget build(BuildContext context) {
    final List<CarSpaceEntity> historicList =
        _filterSpacesWithVehicle(spaceList);

    return ListView.builder(
      itemCount: historicList.length,
      itemBuilder: (context, index) {
        final item = historicList[index];
        return historicList.isNotEmpty
            ? TimelineTile(
                alignment: TimelineAlign.manual,
                lineXY: 0.2,
                isFirst: index == 0,
                isLast: index == historicList.length - 1,
                indicatorStyle: const IndicatorStyle(
                  width: 20,
                  color: Colors.blue,
                ),
                endChild: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  child: Card(
                    color: item.isAvailable
                        ? ConstsApp.getColorType(isAvailable: item.isAvailable)!
                            .withOpacity(0.6)
                        : ConstsApp.getColorType(isAvailable: item.isAvailable)!
                            .withOpacity(0.6),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Vaga ${item.number!}',
                            style: const TextStyle(
                              fontSize: 20.0,
                              fontFamily: 'Google',
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Placa: ${item.vehicle?.identifier!.toUpperCase()}',
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontFamily: 'Google',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Data Entrada: ${DateFormat('dd/MM/yyyy').format(
                              DateTime.parse(item.vehicle!.input!),
                            )}',
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontFamily: 'Google',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          item.vehicle!.output != null
                              ? Text(
                                  'Data Entrada: ${DateFormat('dd/MM/yyyy').format(
                                    DateTime.parse(item.vehicle!.output!),
                                  )}',
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    fontFamily: 'Google',
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            : const Center(
                child: Text(
                  'Sem registro de entrada e saída de veículos.',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Google',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
      },
    );
  }
}
