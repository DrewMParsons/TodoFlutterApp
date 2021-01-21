import 'package:flutter/material.dart';

class ChoreTile extends StatelessWidget {
  final bool isChecked;
  final String choreTitle;
  final Function checkboxCallback;
  final Function longPressCallback;

  ChoreTile(
      {this.isChecked,
      this.choreTitle,
      this.checkboxCallback,
      this.longPressCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        choreTitle,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: checkboxCallback,
      ),
      onLongPress: longPressCallback,
    );
  }
}
