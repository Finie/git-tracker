import 'package:git_issue/models/User.dart';

class AddItemAction{
  static int _id = 0;
  final String _username;
  final String _email;
  final String _userId;
  final String _profileUrl;


  AddItemAction(this._username, this._email, this._userId, this._profileUrl){
    _id++;
  }

  int get id => _id;
  String get email => _email;
  String get username => _username;
  String get userId => _userId;
  String get profileUrl => _profileUrl;
}



class RemoveItemAction{
  final User user;
  RemoveItemAction(this.user);
}

class RemoveItemsActions{}