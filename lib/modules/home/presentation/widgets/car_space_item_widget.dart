import 'package:flutter/material.dart';

class CarSpaceItemWidget extends StatelessWidget {
  final String space;

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
            getColorType(type: 'Grass')!,
            getColorType(type: 'Grass')!.withOpacity(0.7),
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
    required String type,
  }) {
    switch (type) {
      case 'Normal':
        return Colors.brown[400];

      case 'Fire':
        return Colors.red;

      case 'Water':
        return Colors.blue;

      case 'Grass':
        return Colors.green;

      case 'Electric':
        return Colors.amber;

      case 'Ice':
        return Colors.cyanAccent[400];

      case 'Fighting':
        return Colors.orange;

      case 'Poison':
        return Colors.purple;

      case 'Ground':
        return Colors.orange[300];

      case 'Flying':
        return Colors.indigo[200];

      case 'Psychic':
        return Colors.pink;

      case 'Bug':
        return Colors.lightGreen[500];

      case 'Rock':
        return Colors.grey;

      case 'Ghost':
        return Colors.indigo[400];

      case 'Dark':
        return Colors.brown;

      case 'Dragon':
        return Colors.indigo[800];

      case 'Steel':
        return Colors.blueGrey;

      case 'Fairy':
        return Colors.pinkAccent[100];

      default:
        return Colors.grey;
    }
  }
}
