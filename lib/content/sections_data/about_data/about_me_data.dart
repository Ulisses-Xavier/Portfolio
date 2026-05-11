import 'package:portfolio/core/translation/body_sections_texts/about_sections_texts.dart';
import 'package:portfolio/core/translation/local_text.dart';
import 'package:portfolio/shared/info_field/info_field_model.dart';
import 'package:portfolio/shared/info_section/info_section_model.dart';

final InfoSectionModel aboutMeData = InfoSectionModel(
  title: AboutMeTexts.title,
  header: AboutMeTexts.header,
  description: AboutMeTexts.description,
  infoFields: [
    InfoFieldModel(
      label: LocalText(pt: "Idade", en: "Age"),
      value: LocalText(pt: "19", en: "19"),
    ),
    InfoFieldModel(
      label: LocalText(pt: "Cidade", en: "City"),
      value: LocalText(pt: "Manaus", en: "Manaus"),
    ),
    InfoFieldModel(
      label: LocalText(pt: "Estado", en: "State"),
      value: LocalText(pt: "Amazonas", en: "Amazonas"),
    ),
    InfoFieldModel(
      label: LocalText(pt: "País", en: "Country"),
      value: LocalText(pt: "Brasil", en: "Brazil"),
    ),
  ],
);
