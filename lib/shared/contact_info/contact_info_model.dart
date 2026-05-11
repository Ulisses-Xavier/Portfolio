import 'package:flutter/material.dart';
import 'package:portfolio/core/translation/local_text.dart';

class IconnedInfo {
  final String text;
  final IconData icon;

  IconnedInfo({required this.text, required this.icon});
}

class ContactInfoModel {
  final LocalText title;
  final LocalText description;
  final List<IconnedInfo> children;

  ContactInfoModel({
    required this.title,
    required this.description,
    required this.children,
  });
}
