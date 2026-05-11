import 'package:flutter/material.dart';
import 'package:portfolio/core/color_theme.dart';
import 'package:portfolio/core/fonts.dart';
import 'package:portfolio/core/utils/utils.dart';
import 'package:portfolio/shared/work_grid/work_card/work_card_model.dart';

class WorkCard extends StatefulWidget {
  final WorkCardModel model;
  final ColorTheme colors;
  final String lang;
  const WorkCard({
    super.key,
    required this.model,
    required this.colors,
    required this.lang,
  });

  @override
  State<WorkCard> createState() => _WorkCardState();
}

class _WorkCardState extends State<WorkCard> {
  bool showAll = false;

  @override
  Widget build(BuildContext context) {
    final ColorTheme colors = widget.colors;
    final WorkCardModel model = widget.model;
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () => setState(() {
            showAll = !showAll;
          }),
          child: SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    model.image,
                    width: double.infinity,
                    fit: BoxFit.fitWidth,
                  ),
                  SizedBox(height: 5),
                  Text(
                    model.title.get(widget.lang),
                    style: TextStyle(
                      color: colors.tertiaryColor,
                      fontFamily: Fonts.secondary,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  if (showAll)
                    Text(
                      model.description.get(widget.lang),
                      maxLines: 100,
                      style: TextStyle(
                        color: colors.tertiaryColor,
                        fontFamily: Fonts.primary,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  if (showAll) SizedBox(height: 10),
                  if (showAll)
                    MyButton(
                      isLoading: false,
                      height: 40,
                      width: double.infinity,
                      color: Colors.transparent,
                      border: Border.all(
                        width: 0.1,
                        color: colors.tertiaryColor,
                      ),
                      text: "Ver mais",
                      textStyle: TextStyle(
                        color: colors.tertiaryColor,
                        fontFamily: Fonts.primary,
                      ),
                      onTap: () {
                        openUrl(model.url);
                      },
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
