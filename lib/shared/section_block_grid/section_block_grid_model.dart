import 'package:portfolio/core/translation/local_text.dart';
import 'package:portfolio/shared/section_block_grid/section_block/section_block_model.dart';

class SectionBlockGridModel {
  final LocalText title;
  final List<SectionBlockModel> sections;
  SectionBlockGridModel({required this.title, required this.sections});
}
