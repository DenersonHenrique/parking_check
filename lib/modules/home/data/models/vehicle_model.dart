import 'dart:convert';

import '../../domain/entities/vehicle_entity.dart';

class VehicleModel extends VehicleEntity {
  const VehicleModel({
    required super.identifier,
    required super.input,
    required super.output,
  });

  factory VehicleModel.fromMap(Map<String, dynamic> map) => VehicleModel(
        identifier: map['identifier'],
        input: map['input'],
        output: map['output'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['identifier'] = identifier;
    data['input'] = input;
    data['output'] = output;
    return data;
  }

  factory VehicleModel.fromEntity(VehicleEntity entity) => VehicleModel(
        identifier: entity.identifier,
        input: entity.input,
        output: entity.output,
      );

  factory VehicleModel.fromJson(String source) =>
      VehicleModel.fromMap(json.decode(source));
}
