import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:portfolio/core/translation/body_sections_texts/resume_sections_texts.dart';
import 'package:portfolio/shared/section_block_grid/section_block/blocks/check_list/check_list.dart';
import 'package:portfolio/shared/section_block_grid/section_block/blocks/experiences/experience_list.dart';
import 'package:portfolio/shared/section_block_grid/section_block/blocks/experiences/experience_model.dart';
import 'package:portfolio/shared/section_block_grid/section_block/blocks/skills_graphic/animated_graphic_bar.dart';
import 'package:portfolio/shared/section_block_grid/section_block/blocks/skills_graphic/skills_graphic.dart';
import 'package:portfolio/shared/section_block_grid/section_block/section_block_model.dart';
import 'package:portfolio/shared/section_block_grid/section_block_grid_model.dart';

SectionBlockGridModel resumeData = SectionBlockGridModel(
  title: SkillsTexts.title,
  sections: [
    SectionBlockModel(
      title: SkillsTexts.block1title,
      description: SkillsTexts.block1description,
      icon: PhosphorIcons.bracketsAngle(),
      block: SkillsGraphic(
        bars: [
          AnimatedGraphicBar(percentage: 90, title: "Flutter"),
          AnimatedGraphicBar(percentage: 45, title: "Python"),
          AnimatedGraphicBar(percentage: 70, title: "Firebase"),
          AnimatedGraphicBar(percentage: 80, title: "SQL/NoSQL"),
        ],
      ),
    ),
    SectionBlockModel(
      title: SkillsTexts.block2title,
      description: SkillsTexts.block2description,
      icon: PhosphorIcons.brain(),
      block: CheckList(
        items: [
          "REST APIs",
          "Authentication",
          "State Management",
          "Database Design",
          "Cross-Platform",
        ],
      ),
    ),
  ],
);

SectionBlockGridModel experienceData = SectionBlockGridModel(
  title: ExperienceTexts.title,
  sections: [
    SectionBlockModel(
      title: ExperienceTexts.block1title,
      description: ExperienceTexts.block1description,
      icon: PhosphorIcons.coffee(),
      block: ExperienceList(
        experiences: [
          ExperienceModel(
            time: ExperienceTexts.exp1time,
            position: ExperienceTexts.exp1position,
            organization: "SEMED AM",
            image: "assets/experiences_images/semed_logo.png",
            description: ExperienceTexts.exp1description,
          ),
        ],
      ),
    ),
    SectionBlockModel(
      title: ExperienceTexts.block2title,
      description: ExperienceTexts.block2description,
      icon: PhosphorIcons.graduationCap(),
      block: ExperienceList(
        experiences: [
          ExperienceModel(
            time: ExperienceTexts.exp2time,
            position: ExperienceTexts.exp2position,
            organization: "Martha Falcão - Wyden",
            description: ExperienceTexts.exp2description,
          ),
        ],
      ),
    ),
  ],
);
