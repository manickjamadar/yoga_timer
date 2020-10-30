import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yogatimer/helpers/format_time.dart';

class TimeSet extends StatelessWidget {
  final String title;
  final Duration time;
  final void Function(Duration time) onTimeChanged;

  const TimeSet(
      {Key key, @required this.title, @required this.time, this.onTimeChanged})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: () => _onChipPressed(context),
          child: Chip(
            backgroundColor: Colors.blue[50],
            label: Text(
              formatTimeInWords(time),
              style: TextStyle(color: Colors.blue[500]),
            ),
          ),
        )
      ],
    );
  }

  void _onChipPressed(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (_) {
          return Container(
            height: 200,
            child: CupertinoTimerPicker(
              initialTimerDuration: time,
              onTimerDurationChanged: (Duration duration) {
                if (onTimeChanged != null) onTimeChanged(duration);
              },
            ),
          );
        });
  }
}
