import 'package:flutter/material.dart';
import 'package:portfolio/core/translation/local_text.dart';

class SectionBlockModel {
  final LocalText title;
  final LocalText description;
  final IconData? icon;
  final String? image;
  final Widget block;
  const SectionBlockModel({
    required this.title,
    required this.description,
    this.icon,
    this.image,
    required this.block,
  });
}
