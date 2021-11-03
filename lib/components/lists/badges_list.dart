import '../screens/profile_screen/badge_widget.dart';
import 'package:flutter/material.dart';

class BadgesList extends StatelessWidget {
    final List<String> badges = [
        'badge-01.png',
        'badge-02.png',
        'badge-03.png',
        'badge-04.png',
        'badge-05.png',
        'badge-06.png',
        'badge-07.png',
        'badge-08.png',
    ];
    
    @override
    Widget build(BuildContext context) {
        return Container(
            height: 112,
            child: ListView.builder(
                padding: const EdgeInsets.only(
                    bottom: 28,
                ),
                scrollDirection: Axis.horizontal,
                itemCount: badges.length,
                itemBuilder: (context, index) {
                    return BadgeWidget(
                        badges: badges, 
                        index: index,
                    );
                },
            ),
        );
    }
}