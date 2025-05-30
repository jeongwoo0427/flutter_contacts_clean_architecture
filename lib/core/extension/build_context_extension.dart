import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext{
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}