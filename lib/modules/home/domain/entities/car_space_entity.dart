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
    this.isAvailable = true,
    this.vehicle,
  });

  CarSpaceEntity copyWith({
    bool? isAvailable,
    VehicleEntity? vehicle,
  }) {
    return CarSpaceEntity(
      id: id,
      number: number,
      isAvailable: isAvailable ?? false,
      vehicle: vehicle ?? vehicle,
    );
  }

  @override
  List<Object?> get props => [
        number,
        id,
        isAvailable,
        vehicle,
      ];
}
