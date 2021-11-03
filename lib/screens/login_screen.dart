import 'home_screen.dart';
import '../utils/app_assets.dart';
import '../utils/app_colors.dart';
import '../utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginScreen extends StatefulWidget {
    @override
    _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
    String email        = '';
    String password     = '';
    final _auth         = FirebaseAuth.instance;
    final _firestore    = FirebaseFirestore.instance;

    Future<void> createNewUserData() async {
        await _firestore 
            .collection('users')
            .doc(_auth.currentUser?.uid)
            .set({
                'name': 'User',
                'uid': _auth.currentUser?.uid,
                "bio": 'Design+Code Student',
                'completed': [],
                'recents': [],
                'badges': [],
                'certificates': [],
                'profilePic': ''
            });
    }

    Future<void> signInOrCreateNewUser() async {
        try {
            await _auth.signInWithEmailAndPassword(email: email, password: password);

            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                ),
            );
        } on FirebaseAuthException catch (error) {
            if (error.code == "user-not-found") {
                signUpNewUser();
            } else {
                buildErrorDialog(error.message);
            }
        }
    }

    Future<void> signUpNewUser() async {
        try {
            await _auth
                .createUserWithEmailAndPassword(email: email, password: password)
                .then((user) {
                    ///
                    /// this line sends the user an email to ask for verification
                    /// for this new account that's been created
                    ///
                    user.user?.sendEmailVerification();

                    ///
                    /// create a new user document in firestore
                    ///
                    createNewUserData();

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                        ),
                    );
                });
        } catch (error) {
            // ignore: avoid_print
            buildErrorDialog(error.toString());
        }
    }

    void buildErrorDialog(String? error) {
        showDialog(
            context: context, 
            builder: (context) {
                return AlertDialog(
                    title: const Text('Error!'),
                    content: Text(error ?? 'some error occurred'),
                    actions: [
                        // ignore: deprecated_member_use
                        FlatButton(
                            onPressed: () {
                                Navigator.of(context).pop();
                            }, 
                            child: const Text('Ok',),
                        )
                    ],
                );
            },
        );
    }

    Widget buildEmailTextField() {
        return TextField(
            cursorColor: AppColors.kPrimaryLabelColor,
            decoration: InputDecoration(
                icon: const Icon(
                    Icons.email,
                    color: Color(0xFF5488F1),
                    size: 20,
                ),
                border: InputBorder.none,
                hintText: 'Email Address...',
                hintStyle: kLoginInputTextStyle,
            ),
            style: kLoginInputTextStyle.copyWith(
                color: Colors.black,
            ),
            onChanged: (textEntered) {
                email = textEntered;
                print(email);
            },
        );
    }

    Widget buildPasswordTextField() {
        return TextField(
            cursorColor: AppColors.kPrimaryLabelColor,
            obscureText: true,
            decoration: InputDecoration(
                icon: const Icon(
                    Icons.lock,
                    color: Color(0xFF5488F1),
                    size: 20,
                ),
                border: InputBorder.none,
                hintText: 'Password...',
                hintStyle: kLoginInputTextStyle,
            ),
            style: kLoginInputTextStyle.copyWith(
                color: Colors.black,
            ),
            onChanged: (textEntered) {
                password = textEntered;
                print(password);
            },
        );
    }

    Widget buildTextFields() {
        return Column(
            children: [
                Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14,),
                        boxShadow: const [
                            BoxShadow(
                                color: AppColors.kShadowColor,
                                offset: Offset(0, 12),
                                blurRadius: 16,
                            ),
                        ],
                    ),
                    child: Column(
                        children: [
                            Padding(
                                padding: const EdgeInsets.only(
                                    top: 5,
                                    right: 16,
                                    left: 16
                                ),
                                child: buildEmailTextField(),
                            ),
                            const Divider(),
                            Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 5,
                                    right: 16,
                                    left: 16
                                ),
                                child: buildPasswordTextField(),
                            )
                        ],
                    ),
                ),
            ],
        );
    }

    Widget buildForgotPasswordText() {
        return Container(
            child: Text(
                'Forgot Password?',
                style: kCallOutLabelStyle.copyWith(
                    color: const Color(0x721B1E9C)
                ),
            ),
        );
    }

    Widget buildLoginPageHeader() {
        return Stack(
            alignment: Alignment.center,
            children: [
                Container(
                    ///
                    /// this line is for lifting the container up
                    ///
                    transform: Matrix4.translationValues(0, -75, 0),
                    child: Image.asset(AppAssets.illustration14),
                ),
                Container(
                    transform: Matrix4.translationValues(0, -170, 0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                            Text(
                                'Learn to Design\nand Code apps',
                                style: kLargeTitleStyle.copyWith(
                                    color: Colors.white,
                                ),
                            ),
                            const SizedBox(
                                height: 10,
                            ),
                            Text(
                                'Completed Courses about The Best\nTools and Design Systems',
                                style: kHeadlineLabelStyle.copyWith(
                                    color: Colors.white70,
                                ),
                                textAlign: TextAlign.center,
                            ),
                        ],
                    ),
                ),
            ],
        );
    }

    Widget buildLoginButton() {
        return Row(
            children: [
                GestureDetector(
                    onTap: signInOrCreateNewUser,
                    child: Container(
                        child: Text(
                            'Login',
                            style: kCallOutLabelStyle.copyWith(
                                color: Colors.white,
                            ),
                        ),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            gradient: const LinearGradient(
                                colors: [
                                    Color(0xFF73A0F4),
                                    Color(0xFF4A47F5),
                                ],
                            ),
                        ),
                        height: 47,
                        width: MediaQuery.of(context).size.width * 0.3,
                    ),
                ),
            ],
        );
    }

    Widget buildForgetPasswordButton() {
        return GestureDetector(
            ///
            /// send a reset email password to the user
            ///
            onTap: () {
                _auth
                    .sendPasswordResetEmail(email: email)
                    .then((value) => {
                        showDialog(context: context, builder: (context) {
                            return AlertDialog(
                                title: const Text('Email Sent!'),
                                content: const Text('The password reset email has been sent!'),
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
                        })
                    });
            },
            child: buildForgotPasswordText(),
        );
    }

    Widget buildLoginForm() {
        return Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 53,
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                    Text(
                        'Log In to', 
                        style: kTitle1Style,
                    ),
                    Text(
                        'Start Learning', 
                        style: kTitle1Style.apply(
                            color: const Color(0xFF5B4CF0)
                        ),
                    ),
                    const SizedBox(
                        height: 15,
                    ),
                    Container(
                        height: 130,
                        child: buildTextFields(),
                    ),
                    const SizedBox(
                        height: 15,
                    ),
                    buildLoginButton(),
                    const SizedBox(
                        height: 15,
                    ),
                    buildForgetPasswordButton(),
                ],
            ),
        );
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Container(
                color: AppColors.kSidebarBackgroundColor,
                child: ListView(
                    children: [
                        Column(
                            children: [
                                buildLoginPageHeader(),
                                Container(
                                    transform: Matrix4.translationValues(0, -150, 0),
                                    child: buildLoginForm(),
                                ),
                            ],
                        ),
                    ],
                ),
            ),
        );
    }
}