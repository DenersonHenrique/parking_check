import 'package:equatable/equatable.dart';

import 'vehicle_entity.dart';

class CarSpaceEntity extends Equatable {
  final int? id;
  final String? number;
  final bool isAvailable;
  final VehicleEntity? vehicle;

  const CarSpaceEntity({
    required this.id,
    required this.number,
    this.isAvailable = false,
    this.vehicle,
  });

  @override
  List<Object?> get props => [
        number,
        id,
        isAvailable,
        vehicle,
      ];
}
