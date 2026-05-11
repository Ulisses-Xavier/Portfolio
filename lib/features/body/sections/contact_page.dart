import 'package:flutter/widgets.dart';
import 'package:portfolio/content/sections_data/contact_data/contact_data.dart';
import 'package:portfolio/shared/contact_info/contact_info.dart';
import 'package:portfolio/shared/message_field/message_field.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ContactInfo(model: contactData),
        SizedBox(height: 40),
        MessageField(),
      ],
    );
  }
}
