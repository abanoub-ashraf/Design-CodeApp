import 'dart:io';

import '../models/sidebar_item_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<SidebarItemModel> sideBarItems = [
    SidebarItemModel(
        title: "Home",
        background: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
                Color(0xFF00AEFF),
                Color(0xFF0076FF),
            ],
        ),
        icon: Icon(
            Platform.isAndroid 
                ? Icons.home 
                : CupertinoIcons.home,
            color: Colors.white,
        ),
    ),
    SidebarItemModel(
        title: "Courses",
        background: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
                Color(0xFFFA7d75),
                Color(0xFFC23D61),
            ],
        ),
        icon: Icon(
            Platform.isAndroid 
                ? Icons.library_books 
                : CupertinoIcons.book_solid,
            color: Colors.white,
        ),
    ),
    SidebarItemModel(
        title: "Billing",
        background: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
                Color(0xFFFAD64A),
                Color(0xFFEA880F),
            ],
        ),
        icon: Icon(
            Platform.isAndroid 
                ? Icons.credit_card 
                : CupertinoIcons.creditcard,
            color: Colors.white,
        ),
    ),
    SidebarItemModel(
        title: "Settings",
        background: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
                Color(0xFF4E62CC),
                Color(0xFF202A78),
            ],
        ),
        icon: Icon(
            Platform.isAndroid 
                ? Icons.settings 
                : CupertinoIcons.settings,
            color: Colors.white,
        ),
    )
];