import 'package:flutter/material.dart';

class CarInfoWidget extends StatelessWidget {
  final String info;

  const CarInfoWidget({
    super.key,
    required this.info,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(80, 72, 70, 70),
          ),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(
              info.trim().toUpperCase(),
              style: const TextStyle(
                fontFamily: 'Google',
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
