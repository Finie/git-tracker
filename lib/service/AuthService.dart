import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:git_issue/security/secrets_keys.dart' as SecretKey;
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:git_issue/models/GitHubLoginRequest.dart';
import 'package:git_issue/models/GitHubLoginResponse.dart';

class AuthService{

  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
  Future<auth.User> loginWithGitHub(String code) async {
print("Logging in with code $code");
    //ACCESS TOKEN REQUEST
    final response = await http.post(
      "https://github.com/login/oauth/access_token",
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json"
      },
      body: jsonEncode(GitHubLoginRequest(
        clientId: SecretKey.GITHUB_CLIENT_ID,
        clientSecret: SecretKey.GITHUB_CLIENT_SECRET,
        code: code,
      )),
    );
    GitHubLoginResponse loginResponse = GitHubLoginResponse.fromJson(json.decode(response.body));

    print("login response is $loginResponse");

    //FIREBASE SIGNIN
    final auth.AuthCredential credential = auth.GithubAuthProvider.credential(loginResponse.accessToken);

    final auth.User user = (await _firebaseAuth.signInWithCredential(credential)).user;
    return user;
  }
}