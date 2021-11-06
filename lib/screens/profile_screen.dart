import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/lists/badges_list.dart';
import '../components/screens/profile_screen/completed_courses_section.dart';
import '../components/screens/profile_screen/profile_certificates_viewer.dart';
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

    void updateUserData() {
        _firestore
            .collection('users')
            .doc(_auth.currentUser?.uid)
            .update({
                'name': name,
                'bio': bio
            })
            .then((value) {
                showDialog(context: context, builder: (context) {
                    return AlertDialog(
                        title: const Text('Success!'),
                        content: const Text('The Profile Data has been updated'),
                        actions: [
                            // ignore: deprecated_member_use
                            FlatButton(
                                onPressed: () {
                                    Navigator.of(context).pop();
                                },
                                child: const Text('Ok!'),
                            )
                        ],
                    );
                });
            })
            .catchError((error) {
                showDialog(context: context, builder: (context) {
                    return AlertDialog(
                        title: const Text('Uh-Oh!'),
                        content: Text('$error'),
                        actions: [
                            // ignore: deprecated_member_use
                            FlatButton(
                                onPressed: () {
                                    Navigator.of(context).pop();
                                },
                                child: const Text('Try Again!'),
                            )
                        ],
                    );
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
                                        Padding(
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
                                                        child: GestureDetector(
                                                            onTap: () {
                                                                showDialog(context: context, builder: (context) {
                                                                    return AlertDialog(
                                                                        title: const Text('Update Your Profile'),
                                                                        content: Column(
                                                                            mainAxisSize: MainAxisSize.min,
                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                            children: [
                                                                                TextField(
                                                                                    onChanged: (newValue) {
                                                                                        setState(() {
                                                                                            name = newValue;
                                                                                        });
                                                                                    },
                                                                                    controller: TextEditingController(
                                                                                        text: name,
                                                                                    ),
                                                                                ),
                                                                                TextField(
                                                                                    onChanged: (newValue) {
                                                                                        setState(() {
                                                                                            bio = newValue;
                                                                                        });
                                                                                    },
                                                                                    controller: TextEditingController(
                                                                                        text: bio,
                                                                                    ),
                                                                                )
                                                                            ],
                                                                        ),
                                                                        actions: [
                                                                            // ignore: deprecated_member_use
                                                                            FlatButton(
                                                                                onPressed: () {
                                                                                    Navigator.of(context).pop();

                                                                                    updateUserData();
                                                                                },
                                                                                child: const Text('Update!'),
                                                                            )
                                                                        ],
                                                                    );
                                                                });
                                                            },
                                                            child: Icon(
                                                                Platform.isAndroid 
                                                                    ? Icons.edit
                                                                    : CupertinoIcons.pencil,
                                                                color: AppColors.kSecondaryLabelColor,
                                                            ),
                                                        ),
                                                    ),
                                                ],
                                            ),
                                        ),
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