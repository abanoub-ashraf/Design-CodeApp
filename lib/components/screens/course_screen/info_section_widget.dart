import '../../../utils/app_styles.dart';
import 'package:flutter/material.dart';

class InfoSectionWidget extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 28,
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Text(
                        '5 years ago, I couldn’t write a single line of Swift. I learned it and moved to React, Flutter while using increasingly complex design tools. I don’t regret learning them because SwiftUI takes all of their best concepts. It is hands-down the best way for designers to take a first step into code.',
                        style: kBodyLabelStyle,
                    ),
                    const SizedBox(
                        height: 24,
                    ),
                    Text(
                        'About this Course',
                        style: kTitle1Style,
                    ),
                    const SizedBox(
                        height: 24,
                    ),
                    Text(
                        "This course was written for people who are passionate about design and about Apple's SwiftUI. It beginner-friendly, but it is also packed with tricks and cool workflows about building the best UI. Currently, Xcode 11 is still in beta so the installation process may be a little hard. However, once you get everything working, then it'll get much friendlier!",
                        style: kBodyLabelStyle,
                    ),
                    const SizedBox(
                        height: 24,
                    ),
                ],
            ),
        );
    }
}