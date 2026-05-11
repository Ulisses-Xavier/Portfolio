import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:portfolio/core/color_theme.dart';
import 'package:portfolio/core/fonts.dart';
import 'package:portfolio/core/providers/language_provider.dart';
import 'package:portfolio/core/providers/theme_provider.dart';
import 'package:portfolio/core/translation/local_text.dart';
import 'package:portfolio/core/utils/utils.dart';
import 'package:portfolio/shared/message_field/my_text_field.dart';
import 'package:portfolio/shared/section_title.dart';

class MessageField extends ConsumerStatefulWidget {
  const MessageField({super.key});

  @override
  ConsumerState<MessageField> createState() => _MessageFieldState();
}

class _MessageFieldState extends ConsumerState<MessageField> {
  //SEND BUTTON LOADING TOGGLE
  bool isLoading = false;

  //CONTROLLERS
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController messageController;

  //ERROR FUNCTION
  String? error;
  void setError(String newError) {
    if (mounted) {
      setState(() {
        error = newError;
      });

      Future.delayed(Duration(seconds: 5), () {
        if (mounted) {
          setState(() {
            error = null;
          });
        }
      });
    }
  }

  //INIT STATE
  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    messageController = TextEditingController();
  }

  //DISPOSE
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = ref.watch(isDarkMode);
    final colors = ColorTheme(isDarkMode: isDark);
    final lang = ref.watch(language);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(
          title: LocalText(pt: "Entre em contato", en: "Contact me").get(lang),
          isDarkMode: isDark,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: MyTextField(
                maxLength: 50,
                controller: nameController,
                height: 40,
                iconWidth: 40,
                counterText: '',
                icon: PhosphorIcons.user(),
                iconSize: 15,
                hint: LocalText(pt: "Nome", en: "Name").get(lang),
                colors: colors,
                isExpanded: false,
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: MyTextField(
                controller: emailController,
                maxLength: 50,
                counterText: '',
                height: 40,
                iconWidth: 40,
                icon: PhosphorIcons.at(),
                iconSize: 15,
                isExpanded: false,
                hint: "Email",
                colors: colors,
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        MyTextField(
          maxLength: 4000,
          controller: messageController,
          height: 200,
          icon: PhosphorIcons.envelope(),
          iconSize: 15,
          isExpanded: true,
          hint: LocalText(pt: "Sua mensagem", en: "Your message").get(lang),
          colors: colors,
          iconWidth: 40,
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyButton(
              isLoading: isLoading,
              text: LocalText(pt: "Enviar", en: "Send").get(lang),
              height: 40,
              width: 100,
              color: Colors.transparent,
              textStyle: TextStyle(
                color: colors.tertiaryColor,
                fontFamily: Fonts.tertiary,
              ),
              border: Border.all(color: colors.tertiaryColor, width: 0.1),
              onTap: () async {
                if (isLoading) return;
                final name = nameController.text.trim();
                final email = emailController.text.trim();
                final message = messageController.text.trim();

                final bool nameEmpty = name.isEmpty;
                final bool emailInvalid = EmailValidator.validate(email);
                final bool messageEmpty = message.isEmpty;

                if (nameEmpty) {
                  if (error == null) {
                    setError(
                      LocalText(
                        pt: "insira um nome válido",
                        en: "Please insert a valid name",
                      ).get(lang),
                    );
                  }
                  return;
                }

                if (!emailInvalid) {
                  if (error == null) {
                    setError(
                      LocalText(
                        pt: "insira um email válido",
                        en: "Please insert a valid email",
                      ).get(lang),
                    );
                  }
                  return;
                }

                if (messageEmpty) {
                  if (error == null) {
                    setError(
                      LocalText(
                        pt: "insira uma mensagem válida",
                        en: "Please insert a valid message",
                      ).get(lang),
                    );
                  }
                  return;
                }

                final db = FirebaseFirestore.instance.collection("messages");
                final data = {
                  "name": name,
                  "email": email,
                  "message": message,
                  "createdAt": FieldValue.serverTimestamp(),
                };

                setState(() => isLoading = true);
                try {
                  await db.add(data);

                  setError(
                    LocalText(
                      pt: "Obrigado pela mensagem\nRetornarei dentro de 48 horas",
                      en: "Thanks for the message\nI'll return within 48 hours",
                    ).get(lang),
                  );

                  nameController.clear();

                  emailController.clear();

                  messageController.clear();
                } catch (_) {
                  if (error == null) {
                    setError(
                      LocalText(
                        pt: "Erro ao enviar mensagem",
                        en: "Error while sending the message",
                      ).get(lang),
                    );
                  }
                } finally {
                  if (mounted) {
                    setState(() {
                      isLoading = false;
                    });
                  }
                }
              },
            ),
            if (error != null)
              Text(
                error!,
                style: TextStyle(
                  color: colors.tertiaryColor,
                  fontFamily: Fonts.tertiary,
                ),
              ),
          ],
        ),
      ],
    );
  }
}
