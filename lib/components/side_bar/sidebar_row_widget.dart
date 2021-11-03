import 'package:flutter/material.dart';

import '../../models/sidebar_item_model.dart';
import '../../utils/app_styles.dart';

class SidebarRowWidget extends StatelessWidget {
    final SidebarItemModel item;

    const SidebarRowWidget({
        required this.item
    });

    @override
    Widget build(BuildContext context) {
        return Row(
            children: [
                Container(
                    width: 42.0,
                    height: 42.0,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14.0),
                        gradient: item.background,
                    ),
                    child: item.icon,
                ),
                const SizedBox(
                    width: 12,
                ),
                Text(
                    item.title, 
                    style: kCallOutLabelStyle,
                ),
            ],
        );
    }
}