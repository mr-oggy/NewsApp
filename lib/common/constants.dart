import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  errorStyle: TextStyle(
    color: Colors.white,
    fontSize: 14,
  ),
  counterStyle: TextStyle(color: Colors.orange),
  labelStyle: TextStyle(color: Colors.orange),
  fillColor: Colors.transparent,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 2.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.orange, width: 2.0),
  ),
);
