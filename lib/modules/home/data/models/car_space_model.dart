import 'dart:convert';

import '../../domain/entities/car_space_entity.dart';
import 'vehicle_model.dart';

class CarSpaceModel extends CarSpaceEntity {
  const CarSpaceModel({
    required super.id,
    required super.number,
    required super.isAvailable,
    required VehicleModel? super.vehicle,
  });

  factory CarSpaceModel.fromMap(Map<String, dynamic> map) => CarSpaceModel(
        id: map['id'],
        number: map['num'],
        isAvailable: map['isAvailable'],
        vehicle: map['vehicle'] != null
            ? VehicleModel.fromMap(map['vehicle'])
            : null,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['num'] = number;
    data['isAvailable'] = isAvailable;
    data['vehicle'] = vehicle;
    return data;
  }

  factory CarSpaceModel.fromEntity(CarSpaceEntity entity) => CarSpaceModel(
        id: entity.id,
        number: entity.number,
        isAvailable: entity.isAvailable,
        vehicle: entity.vehicle != null
            ? VehicleModel.fromEntity(entity.vehicle!)
            : null,
      );

  Map<String, dynamic> get toMap => {
        'id': id,
        'num': number,
        'isAvailable': isAvailable,
        'vehicle': vehicle,
      };

  factory CarSpaceModel.fromJson(String source) =>
      CarSpaceModel.fromMap(json.decode(source));
}
