import 'dart:io';
import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:lezhuan/service.dart';

import 'model/user.dart';

class Store {
  Store({this.storageProvider}) {
    userController = new UserService(this)
      ..listen((u) {
        if (u?.id != authenticatedUser?.id) {
          authenticatedUser = u;
        }
      });

    _loadPersistentUser();
  }

  static Store instance = new Store();
  UserService userController;

  String get clientAuthorization =>
      "Basic ${new Base64Encoder().convert("com.shr.lezhuan:shdh".codeUnits)}";

  User get authenticatedUser => _authenticatedUser;

  set authenticatedUser(User u) {
    _authenticatedUser = u;
    if (u != null) {
      storageProvider?.store(_storedUserKey, json.encode(u.asMap()));
    } else {
      storageProvider?.delete(_storedUserKey);
    }
  }

  Future<Response> executeClientRequest(Request request) async {
    request.headers[HttpHeaders.authorizationHeader] = clientAuthorization;
    return executeRequest(request);
  }

  Future<Response> executeUserRequest(Request req,
      {AuthorizationToken token}) async {
    AuthorizationToken t = token ?? authenticatedUser?.token;
    if (t?.isExpired ?? true) {
      throw UnauthenticatedException();
    }

    req.headers[HttpHeaders.authorizationHeader] = t.authorizationHeaderValue;
    var response = await executeRequest(req);
    if (response.statusCode == 401) {
      //Refresh the token,try again
    }
    return response;
  }

  Future<Response> executeRequest(Request request) async {
    try {
      if (request.method == "GET") {
        return Response.fromHTTPResponse(
            await http.get(_baseURL + request.path, headers: request.headers));
      } else if (request.method == "POST") {
        var body = request.body;
        if (request.contentType == ContentType.json) {
          body = json.encode(body);
        } else if (request.contentType.primaryType == "application" &&
            request.contentType.subType == "x-www-form-url-encoded") {
          body = (body as Map<String, String>)
              .keys
              .map((k) => "$k=${Uri.encodeQueryComponent(body[k])}")
              .join("&");
        }

        return Response.fromHTTPResponse(await http.post(
            _baseURL + request.path,
            headers: request.headers,
            body: body));
      }
    } catch (e) {
      return Response.failed(e);
    }
    throw 'Unsupported HTTP method';
  }

  final StorageProvider storageProvider;
  String _baseURL = "http://10.2.116.150:4000";
  User _authenticatedUser;

  String get _storedUserKey => "user.json";

  void _loadPersistentUser() {
    if (storageProvider != null) {
      storageProvider.load(_storedUserKey).then((contents) {
        try {
          authenticatedUser = new User.fromMap(json.decode(contents));
          userController.add(authenticatedUser);
        } catch (_) {
          userController.add(null);
        }
      }).catchError((_) {
        userController.add(null);
      });
    } else {
      userController.add(null);
    }
  }
}

abstract class StorageProvider {
  Future<String> load(String pathOrKey);

  Future<bool> store(String pathOrKey, String contents);

  Future<bool> delete(String pathOrKey);
}

class Request {
  Request.get(this.path) {
    method = "GET";
  }

  Request.post(this.path, this.body, {ContentType contentType}) {
    this.contentType = contentType ?? ContentType.json;
    method = "POST";
  }

  String method;
  String path;
  dynamic body;

  ContentType get contentType => _contentType;

  set contentType(ContentType t) {
    _contentType = t;
    if (_contentType != null) {
      headers[HttpHeaders.contentTypeHeader] = _contentType.mimeType;
    }
  }

  ContentType _contentType;
  Map<String, String> headers = {};
}

class Response {
  Response.fromHTTPResponse(http.Response response) {
    statusCode = response.statusCode;

    var contentType =
        ContentType.parse(response.headers[HttpHeaders.contentTypeHeader]);
    if (contentType.primaryType == "application" &&
        contentType.subType == "json") {
      body = json.decode(response.body);
    }
  }

  Response.failed(this.error);

  int statusCode;
  dynamic body;
  Object error;
}

class UnauthenticatedException implements Exception {}

class APIError {
  String reason;

  APIError(this.reason) {
    reason ??= "Unknown failure";
  }

  @override
  String toString() => reason;
}
