import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'dart:developer' as developer;
import 'package:twitter_login/twitter_login.dart';
// Set provider
final FirebaseAuth _auth = FirebaseAuth.instance;
// Example code of how to sign in with Twitter.


class Toppage extends StatelessWidget {
  // final TextEditingController _tokenController = TextEditingController();
  // final TextEditingController _tokenSecretController = TextEditingController();
  // const Toppage({Key? key}) : super(key: key);
  void _pushPage(BuildContext context, Widget page) {
    Navigator.of(context) /*!*/ .push(
      MaterialPageRoute<void>(builder: (_) => page),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient:  RadialGradient(
              radius: 2,
              colors: [
                Colors.white,
                Colors.blue,
              ],
            )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("なりきり?!CHANGE",style: Theme.of(context).textTheme.headline1),
              Container(
                padding: const EdgeInsets.all(16),
                alignment: Alignment.center,
                child: SignInButton(
                    Buttons.Twitter,
                    text: "Sign in with Twitter",
                    onPressed: _signInWithTwitter
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future<void> _signInWithTwitter() async {
      late UserCredential userCredential;
      final twitterLogin = new TwitterLogin(
          apiKey: 'FCEkaIAUvTatODftHzKB32C4y',
          apiSecretKey:'Rhx6ng3HdFP1wR4ZxchSwrAlU0RgwYFLjXi4p6mvlPy0d54xCC',
          redirectURI: 'twittersdk://'
      );
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
            developer.log(authResult.authToken.toString());
            developer.log(authResult.authTokenSecret.toString());
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

