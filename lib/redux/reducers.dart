import 'package:git_issue/models/User.dart';
import 'package:git_issue/redux/actions.dart';

UserState userStateReducer(UserState userState, action){
  return UserState(userItem: userReducer(userState.userItem, action));
}

List<User> userReducer(List<User> user, action){
  if(action is AddItemAction){
  return []
    ..addAll(user)
    ..add(User(id: action.id, userId: action.userId, username: action.username, email: action.email, profileUrl: action.profileUrl));
  }

  if(action is RemoveItemAction){
    return List.unmodifiable(List.from(user));
  }

  if(action is RemoveItemsActions){
    return List.unmodifiable([]);
  }

return user;
}