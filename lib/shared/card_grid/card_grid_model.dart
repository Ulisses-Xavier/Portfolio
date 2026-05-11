import 'package:flutter/material.dart';
import 'package:portfolio/core/translation/local_text.dart';

class CardModel {
  final String? image;
  final IconData? icon;
  final LocalText title;
  final LocalText description;
  CardModel({
    this.image,
    this.icon,
    required this.title,
    required this.description,
  });
}

class CardGridModel {
  final LocalText title;
  final List<CardModel> cards;
  CardGridModel({required this.title, required this.cards});
}
