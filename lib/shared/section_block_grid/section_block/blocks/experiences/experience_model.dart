import 'package:portfolio/core/translation/local_text.dart';

class ExperienceModel {
  final LocalText time;
  final LocalText position;
  final String organization;
  final String? image;
  final LocalText description;

  ExperienceModel({
    required this.time,
    required this.position,
    required this.organization,
    this.image,
    required this.description,
  });
}
