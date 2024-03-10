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
  Future<void> saveCarSpaces(String key, List<CarSpaceEntity>? value) async {
    final teste = value?.map(CarSpaceModel.fromEntity).toList();
    final list = jsonEncode(
      value?.map(CarSpaceModel.fromEntity).toList(),
      toEncodable: myEncode,
    );
    print(list);
    final response = await _carSpacesLocalDatasource.save(key, list);
    return response;
  }

  dynamic myEncode(dynamic item) {
    if (item.vehicle!.input != null && item.vehicle!.input is DateTime ||
        item.vehicle!.output != null && item.vehicle!.output is DateTime) {
      item.vehicle!.input = item.vehicle!.input.toIso8601String();
      item.vehicle!.output = item.vehicle!.output.toIso8601String();
      return item;
    }
    return item;
  }
}
