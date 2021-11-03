import 'dart:io';
import 'package:flutter/material.dart';
import 'app_colors.dart';

TextStyle kLargeTitleStyle = TextStyle(
    fontSize: 28.0,
    fontWeight: FontWeight.bold,
    color: AppColors.kPrimaryLabelColor,
    fontFamily: Platform.isIOS ? 'SF Pro Text' : null,
    decoration: TextDecoration.none,
);

TextStyle kTitle1Style = TextStyle(
    fontSize: 22.0,
    fontWeight: FontWeight.bold,
    color: AppColors.kPrimaryLabelColor,
    fontFamily: Platform.isIOS ? 'SF Pro Text' : null,
    decoration: TextDecoration.none,
);

TextStyle kCardTitleStyle = TextStyle(
    fontFamily: Platform.isIOS ? 'SF Pro Text' : null,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontSize: 22.0,
    decoration: TextDecoration.none,
);

TextStyle kTitle2Style = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    color: AppColors.kPrimaryLabelColor,
    fontFamily: Platform.isIOS ? 'SF Pro Text' : null,
    decoration: TextDecoration.none,
);

TextStyle kHeadlineLabelStyle = const TextStyle(
    fontSize: 17.0,
    fontWeight: FontWeight.w800,
    color: AppColors.kPrimaryLabelColor,
    fontFamily: 'SF Pro Text',
    decoration: TextDecoration.none,
);

TextStyle kSubtitleStyle = TextStyle(
    fontSize: 16.0,
    color: AppColors.kSecondaryLabelColor,
    fontFamily: Platform.isIOS ? 'SF Pro Text' : null,
    decoration: TextDecoration.none,
);

TextStyle kBodyLabelStyle = TextStyle(
    fontSize: 16.0,
    color: Colors.black,
    fontFamily: Platform.isIOS ? 'SF Pro Text' : null,
    decoration: TextDecoration.none,
);

TextStyle kCallOutLabelStyle = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w800,
    color: AppColors.kPrimaryLabelColor,
    fontFamily: Platform.isIOS ? 'SF Pro Text' : null,
    decoration: TextDecoration.none,
);

TextStyle kSecondaryCallOutLabelStyle = TextStyle(
    fontSize: 16.0,
    color: AppColors.kSecondaryLabelColor,
    fontFamily: Platform.isIOS ? 'SF Pro Text' : null,
    decoration: TextDecoration.none,
);

TextStyle kSearchPlaceholderStyle = TextStyle(
    fontSize: 13.0,
    color: AppColors.kSecondaryLabelColor,
    fontFamily: Platform.isIOS ? 'SF Pro Text' : null,
    decoration: TextDecoration.none,
);

TextStyle kSearchTextStyle = TextStyle(
    fontSize: 13.0,
    color: AppColors.kPrimaryLabelColor,
    fontFamily: Platform.isIOS ? 'SF Pro Text' : null,
    decoration: TextDecoration.none,
);

TextStyle kCardSubtitleStyle = TextStyle(
    fontFamily: Platform.isIOS ? 'SF Pro Text' : null,
    color: const Color(0xE6FFFFFF),
    fontSize: 13.0,
    decoration: TextDecoration.none,
);

TextStyle kCaptionLabelStyle = TextStyle(
    fontSize: 12.0,
    color: AppColors.kSecondaryLabelColor,
    fontFamily: Platform.isIOS ? 'SF Pro Text' : null,
    decoration: TextDecoration.none,
);

TextStyle kLoginInputTextStyle = TextStyle(
    fontSize: 15.0,
    color: Colors.black.withOpacity(0.3),
    fontFamily: Platform.isIOS ? 'SF Pro Text' : null,
    decoration: TextDecoration.none,
);