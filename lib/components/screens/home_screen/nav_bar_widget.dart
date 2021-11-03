import 'search_field_widget.dart';
import '../../side_bar/sidebar_button_widget.dart';
import '../../../screens/profile_screen.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import 'package:flutter/material.dart';

class NavBarWidget extends StatelessWidget {
    final VoidCallback triggerAnimation;

    const NavBarWidget({
        required this.triggerAnimation
    });

    @override
    Widget build(BuildContext context) {
        return Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    SidebarButtonWidget(
                        triggerAnimation: triggerAnimation,
                    ),
                    SearchFieldWidget(),
                    const Icon(
                        Icons.notifications,
                        color: AppColors.kPrimaryLabelColor,
                    ),
                    const SizedBox(
                        width: 16,
                    ),
                    GestureDetector(
                        onTap: () {
                            Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => ProfileScreen(),
                                ),
                            );
                        },
                        child: const CircleAvatar(
                            radius: 18,
                            backgroundImage: AssetImage(AppAssets.profileImage),
                        ),
                    ),
                ],
            ),
        );
    }
}