import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import '../screens/login_screen.dart';

class AppWidget extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return FutureBuilder(
            future: Firebase.initializeApp(),
            builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                    return MaterialApp(
                        debugShowCheckedModeBanner: false,
                        // theme: ThemeData.light().copyWith(
                        // ),
                        // darkTheme: ThemeData.dark().copyWith(
                        // ),
                        home: (FirebaseAuth.instance.currentUser == null) 
                            ? LoginScreen() 
                            : HomeScreen()
                    );
                } else {
                    return MaterialApp(
                        debugShowCheckedModeBanner: false,
                        home: Scaffold(
                            body: Container(),
                        ),
                    );
                }
            },
        );
    }
}