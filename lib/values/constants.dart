import 'package:flutter/material.dart';

//used for routing the add_wedo_screen
const int newItem = -1;
const int editItem = -2;

const textFileDecoration = InputDecoration(
  hintText: 'Enter a value',
  hintStyle: TextStyle(color: Colors.black26),
  fillColor: Colors.white24,
  filled: true,
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black26, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black87, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);
