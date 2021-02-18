import 'package:flutter/cupertino.dart';

class User{
  final String userId;
  final String username;
  final String email;
  final String profileUrl;
  final int id;

  User({
    @required this.id,
    @required this.userId,
    @required this.username,
    @required this.email,
    @required this.profileUrl
  });


  User copyWith({String userId, String username, String email, String profileUrl}){
    return User(
      id: id ?? this.id,
       userId: userId ?? this.userId,
       username: username ?? this.username,
       email: email ?? this.email,
       profileUrl: profileUrl ?? this.profileUrl
    );
  }

}


class UserState {
  final List<User> userItem;

  UserState({@required this.userItem});

  UserState.initialState() : userItem = List.unmodifiable(<User>[]);

}