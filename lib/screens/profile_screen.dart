import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/lists/badges_list.dart';
import '../components/screens/profile_screen/completed_courses_section.dart';
import '../components/screens/profile_screen/profile_certificates_viewer.dart';
import '../components/screens/profile_screen/profile_nav_bar_widget.dart';
import '../components/screens/profile_screen/profile_picture_widget.dart';
import '../utils/app_colors.dart';
import '../utils/app_styles.dart';

class ProfileScreen extends StatefulWidget {
    @override
    State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
    String name         = "Loading...";
    String bio          = "Loading...";
    final _firestore    = FirebaseFirestore.instance;
    final _auth         = FirebaseAuth.instance;

    void loadUserData() {
        _firestore
            .collection('users')
            .doc(_auth.currentUser?.uid)
            .get()
            .then((snapshot) {
                setState(() {
                    name = snapshot.data()?['name'] as String;
                    bio  = snapshot.data()?['bio'] as String;
                });
            });
    }

    @override
    void initState() {
        super.initState();

        loadUserData();
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: AppColors.kBackgroundColor,
            body: SingleChildScrollView(
                child: Column(
                    children: [
                        Container(
                            decoration: const BoxDecoration(
                                color: AppColors.kCardPopupBackgroundColor,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(34),
                                ),
                                boxShadow: [
                                    BoxShadow(
                                        color: AppColors.kShadowColor,
                                        offset: Offset(0, 12),
                                        blurRadius: 32
                                    ),
                                ]
                            ),
                            child: SafeArea(
                                child: Column(
                                    children: [
                                        ProfileNavBarWidget(),
                                        Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20,
                                            ),
                                            child: Row(
                                                children: [
                                                    ProfilePictureWidget(),
                                                    const SizedBox(
                                                        width: 16,
                                                    ),
                                                    Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                            Text(
                                                                name,
                                                                style: kTitle2Style,
                                                            ),
                                                            const SizedBox(
                                                                height: 8,
                                                            ),
                                                            Text(
                                                                bio,
                                                                style: kSecondaryCallOutLabelStyle,
                                                            ),
                                                        ],
                                                    ),
                                                ],
                                            ),
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                top: 28,
                                                bottom: 16,
                                            ),
                                            child: Column(
                                                children: [
                                                    Padding(
                                                        padding: const EdgeInsets.symmetric(
                                                            horizontal: 20,
                                                        ),
                                                        child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                                Text(
                                                                    'Badges',
                                                                    style: kHeadlineLabelStyle,
                                                                ),
                                                                Row(
                                                                    children: [
                                                                        Text(
                                                                            'See All',
                                                                            style: kSearchPlaceholderStyle,
                                                                        ),
                                                                        const Icon(
                                                                            Icons.chevron_right,
                                                                            color: AppColors.kSecondaryLabelColor,
                                                                        ),
                                                                    ],
                                                                ),
                                                            ],
                                                        ),
                                                    ),
                                                ],
                                            ),
                                        ),
                                        const SizedBox(
                                            height: 16,
                                        ),
                                        BadgesList(),
                                    ],
                                ),
                                bottom: false,
                            ),
                        ),
                        ProfileCertificatesViewer(),
                        CompletedCoursesSection(),
                    ],
                ),
            ),
        );
    }
}