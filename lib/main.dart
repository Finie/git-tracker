import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:git_issue/screens/HomeUI.dart';
import 'package:git_issue/screens/LoginScreen.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.white
    ));

    // final Store<UserState> store = Store<UserState>(
    //   userStateReducer,
    //   initialState: UserState.initialState(),
    // );''

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: Color.fromRGBO(236,243,249, 1),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:  HomeUI(),
    );
  }
}