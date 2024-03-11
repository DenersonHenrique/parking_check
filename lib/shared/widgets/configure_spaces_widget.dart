import 'package:flutter/material.dart';

class ConfigSpacesWidget extends StatefulWidget {
  final void Function(int, String) onButtonSave;

  const ConfigSpacesWidget({
    super.key,
    required this.onButtonSave,
  });

  @override
  State<ConfigSpacesWidget> createState() => _ConfigSpacesWidgetState();
}

class _ConfigSpacesWidgetState extends State<ConfigSpacesWidget> {
  final TextEditingController _controller = TextEditingController();
  bool _isValid = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Insira a quantidade total de vagas no estacionamento.',
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Google',
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _controller,
              keyboardType: TextInputType.number,
              maxLength: 6,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.0),
                ),
                labelText: 'Total de vagas',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Campo obrigatório';
                }
                return null;
              },
              onChanged: (value) {
                setState(() {
                  _isValid =
                      int.tryParse(value) != null && int.parse(value) > 0;
                });
              },
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 60,
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
                onPressed: _isValid
                    ? () => widget.onButtonSave(
                          int.parse(_controller.text),
                          'spaces',
                        )
                    : null,
                child: const Text('Salvar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
