import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:portfolio/core/translation/local_text.dart';
import 'package:portfolio/content/profile_data/models.dart';

//Here is where you define your social media info
List<SocialMediaButton> buttons = [
  SocialMediaButton(
    title: "Linkedin",
    icon: PhosphorIcons.linkedinLogo(),
    url: "https://linkedin.com/in/ulisses-xavier-29721630b",
  ),
  SocialMediaButton(
    title: "GitHub",
    icon: PhosphorIcons.githubLogo(),
    url: "https://github.com/Ulisses-Xavier",
  ),
];

//This function will define your profile
//Edit with care
final data = ProfileData(
  name: "Ulisses Xavier",
  subTitle: LocalText(
    pt: "Desenvolvedor de Software",
    en: "Software developer",
  ),
  bannerPath: "assets/profile_images/banner.jpg",
  profileImagePath: "assets/profile_images/profile.jpg",
  socialMedias: buttons,
);
