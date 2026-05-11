import 'package:portfolio/core/translation/local_text.dart';
import 'package:portfolio/shared/info_field/info_field_model.dart';

class InfoSectionModel {
  final LocalText title;
  final LocalText header;
  final LocalText description;
  final List<InfoFieldModel>? infoFields;
  InfoSectionModel({
    required this.title,
    required this.header,
    required this.description,
    this.infoFields,
  });
}
