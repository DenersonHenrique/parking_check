import 'package:flutter/material.dart';

import 'widgets/historic_timeline_widget.dart';

class HistoricView extends StatelessWidget {
  const HistoricView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: VerticalTimeline(),
    );
  }
}
