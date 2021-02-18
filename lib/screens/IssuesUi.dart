import 'package:flutter/material.dart';
import 'package:git_issue/widgets/CommentItem.dart';
import 'package:git_issue/widgets/IssueWidget.dart';

class IssueUi extends StatefulWidget {
  final int index;
  IssueUi({this.index});

  @override
  _IssueUiState createState() => _IssueUiState();
}

class _IssueUiState extends State<IssueUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar: AppBar( title: Text("ISSUE #734839", style: TextStyle(fontSize: 20.0,color:Color.fromRGBO(255,69,0, 100),fontWeight: FontWeight.bold),),
      elevation: 0.0,),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          IssueWidget(),
          Container(
            padding: EdgeInsets.all(10.0),
            child:  Row(
              children: [
                Icon(Icons.addchart_outlined),
                Container(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Text("Comments", style: TextStyle(fontSize: 18.0,color:Color.fromRGBO(51,51,51, 100),fontWeight: FontWeight.bold),)
                ),
                 ],
            ),
          ),
         CommentItem(),
        ],
      ),
    );
  }
}
