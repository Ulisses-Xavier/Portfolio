import 'package:portfolio/core/translation/body_sections_texts/about_sections_texts.dart';
import 'package:portfolio/shared/card_grid/card_grid_model.dart';

final CardGridModel servicesData = CardGridModel(
  title: ServicesTexts.title,
  cards: [
    CardModel(
      title: ServicesTexts.frontEnd,
      description: ServicesTexts.frontEndContent,
      image: "assets/flutter_logo.png",
    ),
    CardModel(
      title: ServicesTexts.backEnd,
      description: ServicesTexts.backEndContent,
      image: "assets/python_logo.png",
    ),
    CardModel(
      title: ServicesTexts.firebase,
      description: ServicesTexts.firebaseContent,
      image: "assets/firebase_logo.png",
    ),
  ],
);
