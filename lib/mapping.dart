import 'package:collegenet/auth.dart';
import 'package:collegenet/homepage.dart';
import 'package:collegenet/loginsignup.dart';
import 'package:flutter/material.dart';

class MappingPage extends StatefulWidget {
  final AuthImplementation auth;

  MappingPage({
    this.auth,
  });
  _MappingPageState createState() => _MappingPageState();
}

enum AuthStatus {
  notSignedIn,
  signedIn,
}

class _MappingPageState extends State<MappingPage> {
  AuthStatus authStatus = AuthStatus.notSignedIn;
  @override
  void initState() {
    super.initState();
    widget.auth.getCurrentUser().then((firebaseUserId) {
      setState(() {
        authStatus = firebaseUserId == null
            ? AuthStatus.notSignedIn
            : AuthStatus.signedIn;
      });
    });
  }


  void _signedIn()
  {
    setState(() {
      authStatus = AuthStatus.signedIn;
    });
  }

  void _signOut()
  {
    setState(() {
      authStatus = AuthStatus.notSignedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch(authStatus)
    {
      case AuthStatus.notSignedIn:
      return new LoginSignupPage(
        auth: widget.auth,
        onSignedIn: _signedIn
      );
      case AuthStatus.signedIn:
      return new HomePage(
        auth: widget.auth,
        onSignedOut: _signOut,
      );    
    }
    return null;
  }
}
