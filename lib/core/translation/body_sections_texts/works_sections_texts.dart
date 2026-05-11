import 'package:portfolio/core/translation/local_text.dart';

class WorksTexts {
  static LocalText works = LocalText(pt: "Projetos", en: "Works");
  //
  //WORK 1
  static LocalText work1title = LocalText(
    pt: "Projeto Storia",
    en: "Project Storia",
  );
  static LocalText work1description = LocalText(
    pt:
        "Plataforma para leitura e publicação de web novels, com dashboard web e aplicativo mobile.\n\n"
        "Stack:\n"
        "- Flutter\n"
        "- Firebase & Firestore\n"
        "- Riverpod & Authentication\n"
        "- SharedPreferences",

    en:
        "A platform for reading and publishing web novels, featuring a web dashboard and mobile application.\n\n"
        "Stack:\n"
        "- Flutter\n"
        "- Firebase & Firestore\n"
        "- Riverpod & Authentication\n"
        "- SharedPreferences",
  );
  //
  //
  //WORK 2
  static const work2title = LocalText(
    pt: "Portfólio Pessoal",
    en: "Personal Portfolio",
  );

  static const work2description = LocalText(
    pt:
        "Portfólio interativo desenvolvido para web, com foco em arquitetura limpa, design responsivo e animações personalizadas.\n\n"
        "Stack:\n"
        "- Flutter Web\n"
        "- Firebase & Firestore\n"
        "- Riverpod & GoRouter\n"
        "- Responsive Design & Animations",

    en:
        "An interactive portfolio built for the web, focused on clean architecture, responsive design, and custom animations.\n\n"
        "Stack:\n"
        "- Flutter Web\n"
        "- Firebase & Firestore\n"
        "- Riverpod & GoRouter\n"
        "- Responsive Design & Animations",
  );
}
