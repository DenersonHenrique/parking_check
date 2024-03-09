import 'package:equatable/equatable.dart';

class VehicleEntity extends Equatable {
  final String? identifier;
  final DateTime? input;
  final DateTime? output;

  const VehicleEntity({
    required this.identifier,
    this.input,
    this.output,
  });

  @override
  List<Object?> get props => [
        identifier,
        input,
        output,
      ];
}
