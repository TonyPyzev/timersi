import 'package:flutter/material.dart';

class CustomTab {
  final String title;
  final Color color;
  final LinearGradient gradient;
  final Widget card;

  const CustomTab({
    required this.title,
    required this.color,
    required this.gradient,
    required this.card,
  });
}
