import 'package:flutter/material.dart';

import '../../../../domain/entities/car_space_entity.dart';

class CarSpaceItemWidget extends StatelessWidget {
  final CarSpaceEntity space;

  const CarSpaceItemWidget({
    super.key,
    required this.space,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            getColorType(isAvailable: space.isAvailable)!,
            getColorType(isAvailable: space.isAvailable)!.withOpacity(0.7),
          ],
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(25.0),
        ),
      ),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Opacity(
              opacity: 0.2,
              child: Image.asset(
                'assets/images/car.png',
                height: MediaQuery.of(context).size.width * 0.35,
                width: MediaQuery.of(context).size.width * 0.35,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 12.0, top: 10),
                child: Text(
                  'Vaga ${space.number!}',
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Google',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(
              //     horizontal: 5.0,
              //     vertical: 5.0,
              //   ),
              //   child: PokeItemTypeWidget(
              //     types: pokemon.type,
              //   ),
              // ),
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Opacity(
              opacity: 0.8,
              child: Image.asset(
                space.isAvailable
                    ? 'assets/images/placa-estacionamento-estacionar.png'
                    : 'assets/images/placa-estacionamento-proibido.png',
                height: MediaQuery.of(context).size.width * 0.25,
                width: MediaQuery.of(context).size.width * 0.25,
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Color? getColorType({
    required bool isAvailable,
  }) {
    switch (isAvailable) {
      case false:
        return Colors.red;

      case true:
        return Colors.green;

      default:
        return Colors.grey;
    }
  }
}
