import 'package:flutter/material.dart';

import '../../domain/entities/car_space_entity.dart';

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
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: <Widget>[
          //     Padding(
          //       padding: const EdgeInsets.only(left: 6.0, top: 10),
          //       child: Text(
          //         space,
          //         style: const TextStyle(
          //           fontSize: 20.0,
          //           fontFamily: 'Google',
          //           color: Colors.white,
          //           fontWeight: FontWeight.bold,
          //         ),
          //       ),
          //     ),
          //     Padding(
          //       padding: const EdgeInsets.symmetric(
          //         horizontal: 5.0,
          //         vertical: 5.0,
          //       ),
          //       child: PokeItemTypeWidget(
          //         types: pokemon.type,
          //       ),
          //     ),
          //   ],
          // ),
          // Align(
          //   alignment: Alignment.bottomRight,
          //   child: Image.network(
          //     pokemon.img!,
          //     // 'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/${pokemon.number}.png',
          //     loadingBuilder: (
          //       BuildContext context,
          //       Widget child,
          //       ImageChunkEvent? loadingProgress,
          //     ) {
          //       if (loadingProgress == null) {
          //         return child;
          //       }
          //       return Center(
          //         child: CircularProgressIndicator(
          //           value: loadingProgress.expectedTotalBytes != null
          //               ? loadingProgress.cumulativeBytesLoaded /
          //                   loadingProgress.expectedTotalBytes!
          //               : null,
          //         ),
          //       );
          //     },
          //     errorBuilder: (
          //       BuildContext context,
          //       Object exception,
          //       StackTrace? stackTrace,
          //     ) {
          //       return const Text('Imagem não encontrada!');
          //     },
          //   ),
          // ),
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
