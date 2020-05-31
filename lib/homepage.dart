import 'package:collegenet/auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  HomePage({
    this.auth,
    this.onSignedOut
  });
  final AuthImplementation auth;
  final VoidCallback onSignedOut;


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //methods
  void _logoutUser() async {
    try{
      await widget.auth.signOut();
      widget.onSignedOut();
    }
    catch(e)
    {
      print("error: "+e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(
            fontFamily: 'Chelsea',
          ),
        ),
        centerTitle: true,
      ),
      body: Container(),
      bottomNavigationBar: new BottomAppBar(
          color: Colors.pink,
          child: Container(
            margin: EdgeInsets.only(left:50.0,right:50.0),
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.exit_to_app),
                onPressed: _logoutUser,
                color: Colors.grey[600],
                iconSize: 40.0,
              ),
              IconButton(
                icon: Icon(Icons.file_upload),
                onPressed: null,
                color: Colors.grey[600],
                iconSize: 40.0,
              ),
            ],
          ))),
    );
  }
}
