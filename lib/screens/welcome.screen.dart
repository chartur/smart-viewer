import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:smart_child_viewer/router.dart';
import 'package:smart_child_viewer/services/auth.service.dart';

class WelcomeScreen extends StatelessWidget {

  final facebookLogin = FacebookLogin();
  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: getBody(context),
    );
  }

  Widget getBody(context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Smart',
                style: Theme.of(context).textTheme.headline1.copyWith(
                  fontWeight: FontWeight.normal,
                  // fontStyle: FontStyle.italic,
                  fontSize: 25.0,
                  letterSpacing: 2.0
                ),
              ),
              SizedBox(width: 5),
              Text(
                'Viewer',
                style: Theme.of(context).textTheme.headline1.copyWith(
                  fontSize: 35.0,
                  fontFamily: 'IndieFlower'
                ),
              ),
            ],
          ),
          Expanded(
            child: Image.asset(
              'assets/images/welcome-bg.png'
            ),
          ),
          Column(
            children: [
              Text(
                'Ողջու՜յն, սիրելի փոքրիկ ',
                style: Theme.of(context).textTheme.headline1,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 5),
              Text(
                'Պատրա՞ստ ես գիտելիքների մեծ պաշար ձեռք բերել համատեղելուվ դիտումներիդ հետ',
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 25),
              SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  onPressed: loginWithFacebook,
                  color: Theme.of(context).primaryColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(FontAwesomeIcons.facebook),
                      SizedBox(width: 10,),
                      Text('Մուտք Facebook-ով'),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: RaisedButton(
                      onPressed: () => Navigator.of(context).pushNamed(AppRouter.loginScreenRoute),
                      child: Text('Մուտք'),
                    )
                  ),
                  SizedBox(width: 15),
                  Expanded(
                      child: RaisedButton(
                        onPressed: () => Navigator.of(context).pushNamed(AppRouter.playerScreenRoute),
                        child: Text('Գրանցում'),
                      )
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  loginWithFacebook() async {
    final result = await facebookLogin.logIn(['email']);
    facebookLogin.loginBehavior = FacebookLoginBehavior.webViewOnly;

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        String fbToken = result.accessToken.token;
        try {
          var res = await authService.getUserDataFromFacebook(fbToken);
          var user = jsonDecode(res.data);
          user['fb_id'] = user['id'];
          user['fb_access_token'] = result.accessToken.token;
          res = await authService.doFacebookLogin(user);
        } catch(e) {

        }
        break;
      case FacebookLoginStatus.cancelledByUser:
        print('canceled');
        break;
      case FacebookLoginStatus.error:
        print('error');
        break;
    }
  }

}
