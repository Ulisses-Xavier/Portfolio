import 'package:flutter/widgets.dart';
import 'package:portfolio/content/sections_data/resume_data/resume_data.dart';
import 'package:portfolio/shared/section_block_grid/section_block_grid.dart';

class ResumePage extends StatelessWidget {
  const ResumePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionBlockGrid(model: resumeData),
        SizedBox(height: 50),
        SectionBlockGrid(model: experienceData),
      ],
    );
  }
}
