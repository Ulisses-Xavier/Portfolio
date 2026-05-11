import 'package:flutter/material.dart';
import 'package:portfolio/core/translation/local_text.dart';

//SOCIAL MEDIA BUTTONS CLASS
class SocialMediaButton {
  final String title;
  final IconData icon;
  final String url;
  SocialMediaButton({
    required this.title,
    required this.icon,
    required this.url,
  });
}

//PROFILE DATA CLASS
class ProfileData {
  final String name;
  final LocalText subTitle;
  final String bannerPath;
  final String profileImagePath;
  final List<SocialMediaButton> socialMedias;
  ProfileData({
    required this.name,
    required this.subTitle,
    required this.profileImagePath,
    required this.bannerPath,
    required this.socialMedias,
  });
}
