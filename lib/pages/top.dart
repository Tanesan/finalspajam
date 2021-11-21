import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'dart:developer' as developer;
import 'package:twitter_login/twitter_login.dart';
import 'package:finalspajam/models/Argument.dart';

// Set provider
final FirebaseAuth _auth = FirebaseAuth.instance;
// Example code of how to sign in with Twitter.

class Toppage extends StatelessWidget {
  // final TextEditingController _tokenController = TextEditingController();
  // final TextEditingController _tokenSecretController = TextEditingController();
  // const Toppage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(-0.4, -0.7),
            stops: [0.0, 0.125, 0.125, 0.25, 0.25, 0.375, 0.375, 0.5, 0.5, 0.625, 0.625, 0.75, 0.75, 0.875, 0.875, 1],
            colors: [
              Color(0xffd9e9fd),
              Color(0xffd9e9fd),
              Colors.white,
              Colors.white,
              Color(0xffd9e9fd),
              Color(0xffd9e9fd),
              Colors.white,
              Colors.white,
              Color(0xffd9e9fd),
              Color(0xffd9e9fd),
              Colors.white,
              Colors.white,
              Color(0xffd9e9fd),
              Color(0xffd9e9fd),
              Colors.white,
              Colors.white,
            ],
            tileMode: TileMode.repeated,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Image.asset('assets/images/logo.png'),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                alignment: Alignment.center,
                child: SignInButton(Buttons.Twitter,
                    text: "Sign in with Twitter",
                    onPressed: () => _signInWithTwitter(context)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _signInWithTwitter(BuildContext context) async {
    late UserCredential userCredential;
    final twitterLogin = new TwitterLogin(
        apiKey: 'FCEkaIAUvTatODftHzKB32C4y',
        apiSecretKey: 'Rhx6ng3HdFP1wR4ZxchSwrAlU0RgwYFLjXi4p6mvlPy0d54xCC',
        redirectURI: 'twittersdk://');
    // https://spajam-final-98e88.firebaseapp.com/__/auth/handler
    // Trigger the sign-in flow
    final authResult = await twitterLogin.login();
    switch (authResult.status) {
      case TwitterLoginStatus.loggedIn:
        final AuthCredential credential = TwitterAuthProvider.credential(
          accessToken: authResult.authToken!,
          secret: authResult.authTokenSecret!,
        );
        userCredential = await _auth.signInWithCredential(credential);

        final user = userCredential.user!;
        Navigator.of(context).pushNamed('/search',
            arguments: Argument(
                accessToken: authResult.authToken!,
                secretAccessToken: authResult.authTokenSecret!,
                userId: authResult.user!.id.toString()));
        break;
      case TwitterLoginStatus.cancelledByUser:
        // cancel
        print('====login cancel====');
        break;
      case TwitterLoginStatus.error:
        // error
        print('====login error====');
        break;
    }
    // print(credential);
  }
}
