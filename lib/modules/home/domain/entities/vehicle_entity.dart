import 'package:equatable/equatable.dart';

class VehicleEntity extends Equatable {
  final int? id;
  final String? identifier;
  final DateTime? input;
  final DateTime? output;

  const VehicleEntity({
    required this.id,
    required this.identifier,
    this.input,
    this.output,
  });

  @override
  List<Object?> get props => [
        id,
        identifier,
        input,
        output,
      ];
}
