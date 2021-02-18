import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:git_issue/widgets/IssueItem.dart';
import 'package:git_issue/widgets/SearchFilter.dart';
import 'package:graphql_flutter/graphql_flutter.dart';


class HomeUI extends StatefulWidget{
  @override
  _HomeUIState createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {

  User user;

  Future<void> getCurrentUser() async{
    User currentUser = await FirebaseAuth.instance.currentUser;
    setState(() {
      user = currentUser;
    });
  }


  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {

print
    final HttpLink httpLink = HttpLink("https://api.github.com/graphql");
    String uid = user.uid;
     final AuthLink authLink = AuthLink(getToken: () async => 'Bearer $uid',);

     final Link link = authLink.concat(httpLink);

     print(link);

     final ValueNotifier<GraphQLClient> client = ValueNotifier(
       GraphQLClient(
         cache: GraphQLCache(),
         link: link,
       )
     );


    return  GraphQLProvider(
      client: client,
      child:   Scaffold(
        backgroundColor: Theme.of(context).accentColor,
        appBar: AppBar(
          title: Text("Today", style: TextStyle(fontSize: 28.0,color: Color.fromRGBO(51,51,51, 100),fontWeight: FontWeight.bold),),
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.app_settings_alt_outlined),
              iconSize: 30.0,
              color: Colors.white10,
              onPressed: (){},
            )
          ],
        ),
        body:  Column(
          children: <Widget>[
            SearchFilter(),
            Expanded(
              child: Container(
                decoration: BoxDecoration(color: Theme.of(context).accentColor),
                child: Container(
                    child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            IssueItem(),
                          ],
                        )
                    )
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  
}

