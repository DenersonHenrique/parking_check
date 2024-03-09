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
  late DateTime? inputDate;
  late DateTime? outputDate;
  final formKey = GlobalKey<FormState>();
  final TextEditingController inputDateController = TextEditingController();
  final TextEditingController outputDateController = TextEditingController();
  final TextEditingController identifierController = TextEditingController();

  _submit() {
    if (!formKey.currentState!.validate()) {
      return;
    }

    final updateSpace = widget.space.copyWith(
      isAvailable: !widget.space.isAvailable,
      vehicle: VehicleEntity(
        identifier: identifierController.text,
        input: inputDate,
        output: outputDateController.text.isNotEmpty ? outputDate : null,
      ),
    );

    widget.onSubmit(updateSpace);
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    super.initState();

    if (!widget.space.isAvailable) {
      identifierController.text = '${widget.space.vehicle?.identifier}';
      inputDateController.text = DateFormat('dd/MM/yyyy').format(
        widget.space.vehicle!.input!,
      );
      inputDate = widget.space.vehicle?.input;
    }
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Atualizar vaga - ${widget.space.number}',
                style: const TextStyle(
                  fontSize: 22.0,
                  fontFamily: 'Google',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TextFormField(
                      maxLength: 7,
                      controller: identifierController,
                      readOnly: !widget.space.isAvailable,
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
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TextFormField(
                      controller: inputDateController,
                      readOnly: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        labelText: 'Data de Entrada',
                      ),
                      onTap: () async {
                        if (widget.space.isAvailable) {
                          inputDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2100),
                          );
                          if (inputDate != null) {
                            String formattedDate =
                                DateFormat('dd/MM/yyyy').format(
                              inputDate!,
                            );

                            inputDateController.text = formattedDate.toString();
                          }
                        }
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo obrigatório';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  Visibility(
                    visible: !widget.space.isAvailable,
                    child: TextFormField(
                      controller: outputDateController,
                      readOnly: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        labelText: 'Data de Saída',
                      ),
                      onTap: () async {
                        if (!widget.space.isAvailable) {
                          outputDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2100),
                          );
                          if (outputDate != null) {
                            String formattedDate =
                                DateFormat('dd/MM/yyyy').format(
                              outputDate!,
                            );

                            outputDateController.text =
                                formattedDate.toString();
                          }
                        }
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo obrigatório';
                        }
                        return null;
                      },
                    ),
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
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontFamily: 'Google',
                        fontWeight: FontWeight.w600,
                      ),
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
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontFamily: 'Google',
                        fontWeight: FontWeight.w600,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          6.0,
                        ),
                      ),
                    ),
                    onPressed: _submit,
                    child: widget.space.isAvailable
                        ? const Text('Adicionar')
                        : const Text('Remover'),
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
