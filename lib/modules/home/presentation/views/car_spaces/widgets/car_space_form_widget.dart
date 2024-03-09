import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../domain/entities/car_space_entity.dart';
import '../../../../domain/entities/vehicle_entity.dart';

class SpaceFormWidget extends StatefulWidget {
  final void Function(CarSpaceEntity space) onSubmit;
  final CarSpaceEntity space;

  const SpaceFormWidget({
    super.key,
    required this.onSubmit,
    required this.space,
  });

  @override
  State<SpaceFormWidget> createState() => _SpaceFormWidgetState();
}

class _SpaceFormWidgetState extends State<SpaceFormWidget> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController inputDateController = TextEditingController();
  final TextEditingController identifierController = TextEditingController();

  late DateTime? inputDate;

  _submit() {
    if (!formKey.currentState!.validate()) {
      return;
    }

    final updateSpace = widget.space.copyWith(
      isAvailable: false,
      vehicle: VehicleEntity(
        identifier: identifierController.text,
        input: inputDate,
      ),
    );

    widget.onSubmit(updateSpace);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 15.0,
          horizontal: 10,
        ),
        child: Column(
          children: [
            Text('Editar vaga ${widget.space.number}'),
            Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    maxLength: 7,
                    controller: identifierController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      labelText: 'Placa',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Campo obrigatório';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: inputDateController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      labelText: 'Data e Hora',
                    ),
                    onTap: () async {
                      inputDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2100),
                      );
                      if (inputDate != null) {
                        String formattedDate = DateFormat('dd/MM/yyyy').format(
                          inputDate!,
                        );

                        inputDateController.text = formattedDate.toString();
                      }
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Campo obrigatório';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF00AE9D),
                      foregroundColor: Colors.white,
                      alignment: Alignment.center,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          6.0,
                        ),
                      ),
                    ),
                    child: const Text('Cancelar'),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF00AE9D),
                      foregroundColor: Colors.white,
                      alignment: Alignment.center,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          6.0,
                        ),
                      ),
                    ),
                    onPressed: () {
                      _submit();
                      Navigator.of(context).pop();
                    },
                    child: const Text('Salvar'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
