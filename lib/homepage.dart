import 'package:collegenet/auth.dart';
import 'package:collegenet/info.dart';
import 'package:collegenet/newpage.dart';
import 'package:collegenet/timeline.dart';
import 'package:flutter/cupertino.dart';
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
  //variables 
  PageController pageController;
  int pageIndex = 0;

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
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  onPageChanged(int pageIndex){
      setState(() {
        this.pageIndex= pageIndex;
      });
  }
  onTap(int pageIndex){
    pageController.jumpToPage(pageIndex);
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
      body: PageView(
        children: <Widget>[
          RaisedButton.icon(
            onPressed: _logoutUser, 
            icon: Icon(Icons.cancel),
            label: Text("SignOut")
          ),
          InfoPage(),
          TimelinePage(),
          NewPage(),
        ],
        controller: pageController,
        onPageChanged: onPageChanged,
        physics: NeverScrollableScrollPhysics()
      ),
      bottomNavigationBar: CupertinoTabBar(
          currentIndex: pageIndex,
          onTap: onTap,
          activeColor: Theme.of(context).primaryColor,
          items: [
            BottomNavigationBarItem(icon:Icon(Icons.whatshot)),
            BottomNavigationBarItem(icon:Icon(Icons.notifications_active)),
            BottomNavigationBarItem(icon:Icon(Icons.airline_seat_recline_extra)),
            BottomNavigationBarItem(icon:Icon(Icons.access_alarm)),
          ]
          )
    );
  }
}
