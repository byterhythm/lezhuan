import 'dart:async';
import 'dart:io';
import 'package:lezhuan/model/user.dart';
import 'package:lezhuan/service_controller.dart';
import 'package:lezhuan/store.dart';

class UserService extends ServiceController<User> {
  UserService(this.store);

  Store store;

  void logout() {
    store.authenticatedUser = null;
    add(null);
  }

  Future<User> login(String username, String password) async {
    var req = Request.post("/auth/token",
        {"username": username, "password": password, "grant_type": "password"},
        contentType: ContentType("application", "x-www-form-urlencoded"));

    var response = await store.executeClientRequest(req);
    if (response.error != null) {
      addError(response.error);
      return null;
    }
    switch (response.statusCode) {
      case 200:
        return getAuthenticatedUser(
            token: AuthorizationToken.fromMap(response.body));
      default:
        addError(APIError(response.body["error"]));
    }

    return null;
  }

  Future<User> register(
      String username, String nickName, String password) async {
    var req = new Request.post("/register",
        {"username": username, "password": password, "nickName": nickName});

    var response = await store.executeClientRequest(req);
    if (response.error != null) {
      addError(response.error);
      return null;
    }

    switch (response.statusCode) {
      case 200:
        return getAuthenticatedUser(
            token: AuthorizationToken.fromMap(response.body));
      case 409:
        addError(APIError("User already exists"));
        break;
      default:
        addError(APIError(response.body["error"]));
    }

    return null;
  }

  Future<User> getAuthenticatedUser({AuthorizationToken token}) async {
    var req = Request.get('/me');
    var response = await store.executeUserRequest(req, token: token);
    if (response.error != null) {
      addError(response.error);
      return null;
    }
    switch (response.statusCode) {
      case 200:
        {
          var user = new User.fromMap(response.body)..token = token;
          add(user);
          return user;
        }
        break;

      default:
        addError(new APIError(response.body["error"]));
    }

    return null;
  }
}
