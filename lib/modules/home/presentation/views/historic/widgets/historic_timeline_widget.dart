import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimelineItem {
  final String title;
  final String description;

  TimelineItem({required this.title, required this.description});
}

class VerticalTimeline extends StatelessWidget {
  // final List<TimelineItem> items;

  final List<TimelineItem> items = [
  TimelineItem(title: 'Event 1', description: 'Description of Event 1'),
  TimelineItem(title: 'Event 2', description: 'Description of Event 2'),
  TimelineItem(title: 'Event 3', description: 'Description of Event 3'),
];

  VerticalTimeline({
    super.key,
    // required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return TimelineTile(
          alignment: TimelineAlign.manual,
          lineXY: 0.2,
          isFirst: index == 0,
          isLast: index == items.length - 1,
          indicatorStyle: const IndicatorStyle(
            width: 20,
            color: Colors.blue,
          ),
          // startChild: Container(
          //   padding: const EdgeInsets.symmetric(vertical: 10),
          //   child: Text(
          //     item.title,
          //     style: const TextStyle(
          //       fontWeight: FontWeight.bold,
          //       fontSize: 16,
          //     ),
          //   ),
          // ),
          endChild: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            child: Text(
              item.description,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ),
        );
      },
    );
  }
}
