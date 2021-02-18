import 'package:flutter/material.dart';

class IssueWidget extends StatefulWidget {
  @override
  _IssueWidgetState createState() => _IssueWidgetState();
}

class _IssueWidgetState extends State<IssueWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      width: double.infinity,
      color: Colors.white,
      padding: new EdgeInsets.only(
          left: 16.0,
          right: 16.0
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Compilation error while building on iOS Simulator fatal error: could not module 'Foundation' "+"#774328",
              maxLines: 3, style: TextStyle(fontSize: 20.0,color:Color.fromRGBO(0,0,0, 100))),
        ],
      )
    );
  }
}
