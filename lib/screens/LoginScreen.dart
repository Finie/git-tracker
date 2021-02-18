import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:git_issue/models/User.dart';
import 'package:git_issue/redux/actions.dart';
import 'package:git_issue/security/secrets_keys.dart' as SecretKey;
import 'package:git_issue/service/AuthService.dart';
import 'package:uni_links/uni_links.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final AuthService authService = AuthService();

  StreamSubscription _subs;

  @override
  void initState() {
    super.initState();
    print("initiate state is being called");
    _initDeepLinkListener();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body:  Column(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                height: 60.0,
                width:double.infinity,
                margin: EdgeInsets.all(20.0),
                child: RaisedButton(
                    color: Colors.black,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
                    onPressed: () {
                      loginWithGithubOnClick();
                    },
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Login with Github",style: TextStyle(fontSize:20.0,color: Colors.white),),
                      ],
                    )

                ),
              ),
            ],
          )

        ],
      ),
    );
  }


  void loginWithGithubOnClick() async{

    const String url = "https://github.com/login/oauth/authorize"+"?client_id="+SecretKey.GITHUB_CLIENT_ID+"&scope=public_repo%20read:user%20user:email";

    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
      );
    } else {
      print("CANNOT LAUNCH THIS URL!");
    }

  }


  @override
  void dispose() {
    _disposeDeepLinkListener();
    super.dispose();
  }
  void _initDeepLinkListener() async {
    _subs = getLinksStream().listen((String link) {
      _checkDeepLink(link);
    }, cancelOnError: true);
  }
  void _checkDeepLink(String link) {
    if (link != null) {

      String code = link.substring(link.indexOf(RegExp('code=')) + 5);
      authService.loginWithGitHub(code)
          .then((firebaseUser) {
            print(firebaseUser.uid);
            print(firebaseUser.refreshToken);
            print(firebaseUser.tenantId);
        print(firebaseUser.email);
        print(firebaseUser.photoURL);
        print("LOGGED IN AS: " + firebaseUser.displayName);
      }).catchError((e) {
        print("LOGIN ERROR: " + e.toString());
      });
    }
  }
  void _disposeDeepLinkListener() {
    if (_subs != null) {
      _subs.cancel();
      _subs = null;
    }
  }

}



// class AddItemWidget extends StatefulWidget {
//   final _ViewModel _viewModel;
//       AddItemWidget(this._viewModel);
//   @override
//   _AddItemWidgetState createState() => _AddItemWidgetState();
// }
//
// class _AddItemWidgetState extends State<AddItemWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }



// class _ViewModel{
//   final List<User> user;
//   final Function(String,String,String,String) onAddItem;
//   final Function(User) onRemoveItem;
//   final Function() onRemoveItems;
//
//   // _ViewModel({this.user, this.onAddItem, this.onRemoveItem, this.onRemoveItems});
//   //
//   // factory _ViewModel.create(Store<UserState> store){
//   //   __onAddItem(String _username, String _email, String _userId, String _profileUrl){
//   //     store.dispatch(AddItemAction(_username, _email, _userId, _profileUrl));
//   //   }
//   //   _onRemoveItem(User user){
//   //     store.dispatch(RemoveItemAction(user));
//   //   }
//   //   _onRemoveItems(){
//   //     store.dispatch(RemoveItemsActions());
//   //   }
//   //   return _ViewModel(
//   //     user: store.state.user,
//   //     onAddItem: __onAddItem,
//   //     onRemoveItem: _onRemoveItem,
//   //     onRemoveItems: _onRemoveItems
//   //   );
//   // }
//   //
//
// }

