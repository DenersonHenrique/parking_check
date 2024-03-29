import 'dart:convert';

import '../../domain/entities/car_space_entity.dart';
import '../../domain/repository/car_spaces_respository.dart';
import '../datasource/car_spaces_local_datasource.dart';
import '../models/car_space_model.dart';
import '../models/vehicle_model.dart';

class CarSpacesRepository implements ICarSpacesRepository {
  final ICarSpacesLocalDatasource _carSpacesLocalDatasource;

  CarSpacesRepository(this._carSpacesLocalDatasource);

  @override
  Future<List<CarSpaceEntity>?> getCarSpaces() async {
    final response = await _carSpacesLocalDatasource.get();
    final result = response
        ?.map(
          (model) => CarSpaceEntity(
            id: model.id,
            number: model.number,
            isAvailable: model.isAvailable,
            vehicle: VehicleModel(
              identifier: model.vehicle?.identifier,
              input: model.vehicle?.input,
              output: model.vehicle?.output,
            ),
          ),
        )
        .toList();

    return result;
  }

  @override
  Future<void>? saveCarSpaces(String key, List<CarSpaceEntity>? value) async {
    final list = jsonEncode(value?.map(CarSpaceModel.fromEntity).toList());
    final response = await _carSpacesLocalDatasource.save(key, list);
    return response;
  }
}
