import 'package:flutter/material.dart';
import 'package:git_issue/screens/IssuesUi.dart';

class IssueItem extends StatefulWidget {
  @override
  _IssueItemState createState() => _IssueItemState();
}

class _IssueItemState extends State<IssueItem> {

  @override
  Widget build(BuildContext context) {

    List<String> gitComment = List<String>();
    gitComment.add("55 Comments");
    gitComment.add("2 Comments");
    gitComment.add("5 Comments");
    gitComment.add("105 Comments");
    return ListView.builder(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        shrinkWrap: true,
        itemCount: gitComment.length,
        itemBuilder: (BuildContext context, int index){
          return  Container(
              margin: new EdgeInsets.only(top: 20.0),
          child: new Material(
            color: Theme.of(context).primaryColor,
            child: new InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=> IssueUi(index: index,) ));
            },
            child: Container(
                width: double.infinity,
                child: Container(
                  padding: new EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Row( children: [
                          Text("Opened ", style: TextStyle(fontSize: 20.0,color:Color.fromRGBO(255,69,0, 100))),
                          Text("29 Oct 2019", style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color:Color.fromRGBO(255,69,0, 100)))
                        ],),
                        RaisedButton(
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          onPressed: () {},
                          child: Text("Open",style: TextStyle(fontSize:20.0,color: Colors.white),),
                        )
                        ],),

                      Container(
                        margin: new EdgeInsets.only(top: 20.0, bottom: 20.0),
                        child: Row(
                          children: [
                            SizedBox(height: 20.0,),
                            Expanded(
                              child: Text("Compilation error while building on iOS Simulator fatal error: could not module 'Foundation' "+"#774328",
                                  maxLines: 3, style: TextStyle(fontSize: 20.0,color:Color.fromRGBO(0,0,0, 100))),
                            ),
                          ],
                        ) ,
                      ),

                     Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.account_circle_outlined,color:Color.fromRGBO(51,51,51, 100)),
                                Text(" developerslearnit",style: TextStyle(fontSize: 20.0,color:Color.fromRGBO(51, 51, 51, 100)))
                              ],),
                            Row(
                              children: [
                                Icon(Icons.messenger_outline_rounded,color:Color.fromRGBO(51,51,51, 100)),
                                Text(" "+gitComment[index],style: TextStyle(fontSize: 20.0,color:Color.fromRGBO(51, 51, 51, 100)))
                              ],  )
                          ],
                        ),
                    ],
                  ),
                ),
            ) ,
          ),
          )
          );

        }
        );



  }
}

