import 'package:flutter/widgets.dart';
import 'package:portfolio/content/sections_data/works_data/works_data.dart';
import 'package:portfolio/core/translation/body_sections_texts/works_sections_texts.dart';
import 'package:portfolio/shared/work_grid/work_grid.dart';

class WorksPage extends StatelessWidget {
  const WorksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WorkGrid(cards: works, title: WorksTexts.works);
  }
}
