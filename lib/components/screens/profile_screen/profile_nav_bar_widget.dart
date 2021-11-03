import 'dart:io';

import '../../../utils/app_colors.dart';
import '../../../utils/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileNavBarWidget extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Padding(
            padding: const EdgeInsets.only(
                top: 24,
                bottom: 32,
                left: 20,
                right: 20,
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    RawMaterialButton(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        constraints: const BoxConstraints(
                            minWidth: 40,
                            maxWidth: 40,
                            maxHeight: 24, 
                        ),
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onPressed: () {
                            Navigator.of(context).pop();
                        },
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                                Icon(
                                    Icons.arrow_back,
                                    color: AppColors.kSecondaryLabelColor,
                                ),
                            ],
                        ),
                    ),
                    Text(
                        'Profile',
                        style: kCallOutLabelStyle,
                    ),
                    Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(14),
                            boxShadow: const [
                                BoxShadow(
                                    color: AppColors.kShadowColor,
                                    offset: Offset(0, 12),
                                    blurRadius: 32,
                                ),
                            ],
                        ),
                        child: Icon(
                            Platform.isAndroid 
                                ? Icons.settings
                                : CupertinoIcons.settings_solid,
                            color: AppColors.kSecondaryLabelColor,
                        ),
                    ),
                ],
            ),
        );
    }
}