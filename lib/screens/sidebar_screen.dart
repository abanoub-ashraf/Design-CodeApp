import '../components/side_bar/sidebar_row_widget.dart';
import '../data/sidebar_items_dummy_data.dart';
import '../utils/app_assets.dart';
import '../utils/app_colors.dart';
import '../utils/app_styles.dart';
import 'package:flutter/material.dart';

class SidebarScreen extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width * 0.85,
            decoration: const BoxDecoration(
                color: AppColors.kSidebarBackgroundColor,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(34.0),
                ),
            ),
            padding: const EdgeInsets.symmetric(
                vertical: 35,
                horizontal: 20,
            ),
            child: SafeArea(
                child: Column(
                    children: [
                        Row(
                            children: [
                                const CircleAvatar(
                                    backgroundImage: AssetImage(AppAssets.profileImage),
                                    radius: 31,
                                ),
                                const SizedBox(
                                    width: 15,
                                ),
                                Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                        Text(
                                            'Abanoub Ashraf',
                                            style: kHeadlineLabelStyle,
                                        ),
                                        const SizedBox(
                                            height: 4,
                                        ),
                                        Text(
                                            'License ends on 21 Jan, 2022',
                                            style: kSearchPlaceholderStyle,
                                        )
                                    ],
                                ),
                            ],
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.08,
                        ),
                        SidebarRowWidget(
                            item: sideBarItems[0],
                        ),
                        const SizedBox(
                            height: 32,
                        ),
                        SidebarRowWidget(
                            item: sideBarItems[1],
                        ),
                        const SizedBox(
                            height: 32,
                        ),
                        SidebarRowWidget(
                            item: sideBarItems[2],
                        ),
                        const SizedBox(
                            height: 32,
                        ),
                        SidebarRowWidget(
                            item: sideBarItems[3],
                        ),
                        const SizedBox(
                            height: 32,
                        ),
                        const Spacer(),
                        Row(
                            children: [
                                Image.asset(
                                    AppAssets.logoutIcon, 
                                    width: 17,
                                ),
                                const SizedBox(
                                    width: 12,
                                ),
                                Text(
                                    'Log out',
                                    style: kSecondaryCallOutLabelStyle,
                                ),
                            ],
                        ),
                    ],
                ),
            )
        );
    }
}