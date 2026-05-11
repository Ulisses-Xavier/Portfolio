import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:portfolio/core/translation/body_sections_texts/contact_sections_texts.dart';
import 'package:portfolio/shared/contact_info/contact_info_model.dart';

ContactInfoModel contactData = ContactInfoModel(
  title: ContactTexts.title,
  description: ContactTexts.description,
  children: [
    IconnedInfo(
      text: "Ulissesxavier37@gmail.com",
      icon: PhosphorIcons.envelope(),
    ),
    IconnedInfo(text: "55+ 92 984253526", icon: PhosphorIcons.whatsappLogo()),
    IconnedInfo(
      text: "Manaus, Amazonas - Brazil",
      icon: PhosphorIcons.mapPin(),
    ),
  ],
);
