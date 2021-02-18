import 'package:flutter/material.dart';

class CommentItem extends StatefulWidget {
  @override
  _CommentItemState createState() => _CommentItemState();
}

class _CommentItemState extends State<CommentItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Theme.of(context).primaryColor,
      ),
      margin: EdgeInsets.only(
        top: 6.0,
        left: 6.0,
        bottom: 6.0,
        right: 6.0
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                child: Row(
                  children: [
                    Icon(Icons.account_circle_outlined),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Text("Comment by #user45623", style: TextStyle(color:Color.fromRGBO(51,51,51, 100),fontWeight: FontWeight.bold),) ,
                    )
                  ],
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(
              top: 16.0,
              bottom: 16.0
            ),
            width: MediaQuery.of(context).size.width*0.8,
            child:
              Column(

                children: <Widget> [
                 new Text("Compilation error while building on iOS Simulator fatal error: could not module error while building on iOS Simulator fatal error: could not module error while building on iOS Simulator fatal error: could not module",
                       style: TextStyle(fontSize: 20.0,color:Color.fromRGBO(0,0,0, 100))),
                ],
              ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Text("Created At 21 Nov 2019", style: TextStyle(color:Color.fromRGBO(51,51,51, 100),fontWeight: FontWeight.bold),) ,
                    ),
                    Icon(Icons.access_alarm_outlined),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
