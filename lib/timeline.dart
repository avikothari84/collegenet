import 'package:flutter/material.dart';
import 'package:collegenet/auth.dart';

class TimelinePage extends StatefulWidget {
  TimelinePage({
    this.auth,
    this.onSignedOut
  });
  final AuthImplementation auth;
  final VoidCallback onSignedOut;
  @override
  _TimelinePageState createState() => _TimelinePageState();
}

class _TimelinePageState extends State<TimelinePage> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("TimeLine"),
    );
  }
}