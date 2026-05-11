import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;
import 'package:flutter/services.dart';
import 'package:portfolio/core/color_theme.dart';
import 'package:portfolio/core/translation/features_texts/profile_texts.dart';
import 'package:portfolio/core/utils/utils.dart';

class CvDownloadButton extends StatelessWidget {
  final ColorTheme colors;
  final String lang;
  const CvDownloadButton({super.key, required this.colors, required this.lang});

  @override
  Widget build(BuildContext context) {
    return MyButton(
      isLoading: false,
      onTap: () async {
        final path =
            "assets/cvs/${lang == "pt" ? "Ulisses_Xavier_pt.pdf" : "Ulisses_Xavier_en.pdf"}";
        final bytes = await rootBundle.load(path);

        final blob = html.Blob([bytes.buffer.asUint8List()]);
        final url = html.Url.createObjectUrlFromBlob(blob);

        html.AnchorElement(href: url)
          ..setAttribute('download', 'Ulisses_Xavier_CV.pdf')
          ..click();

        html.Url.revokeObjectUrl(url);
      },
      text: ProfileTexts.downloadCV.get(lang),
      textStyle: TextStyle(color: colors.tertiaryColor),
      height: 60,
      icon: Icons.download,
      iconColor: colors.tertiaryColor,
      iconSize: 15,
      border: Border.all(color: colors.secondaryColor),
      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5)),
      color: colors.primaryColor,
    );
  }
}
