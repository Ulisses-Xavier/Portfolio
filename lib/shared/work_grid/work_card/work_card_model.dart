import 'package:portfolio/core/translation/local_text.dart';

class WorkCardModel {
  final String image;
  final LocalText title;
  final String url;
  final LocalText description;
  WorkCardModel({
    required this.image,
    required this.title,
    required this.description,
    required this.url,
  });
}
