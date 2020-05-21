class User {

  User.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    shareId = map["shareId"];
    phone = map["phone"];
    nickName = map["nickName"];
    memberLevel = map["memberLevel"];
    userIcon = map["userIcon"];
    holdingEarns = map["holdingEarns"];
    allEarns = map["allEarns"];
    if (map.containsKey("token")) {
      token = new AuthorizationToken.fromMap(map["token"]);
    }
  }

  int id;
  int shareId;
  String phone;
  String nickName;
  AuthorizationToken token;

  //会员等级
  int memberLevel;

  //用户头像
  String userIcon;

  //持有收益
  double holdingEarns;

  //累计收益
  double allEarns;

  Map<String, dynamic> asMap() => {
        "id": id,
        "phone": phone,
        "shareId": shareId,
        "nickName": nickName,
        "token": token.asMap(),
        "memberLevel": memberLevel,
        "userIcon": userIcon,
        "holdingEarns": holdingEarns,
        "allEarns": allEarns
      };
}

class AuthorizationToken {
  AuthorizationToken.fromMap(Map<String, dynamic> map) {
    accessToken = map["access_token"];
    refreshToken = map["refresh_token"];

    if (map.containsKey("expires_in")) {
      expiresAt = new DateTime.now().add(new Duration(seconds: map["expires_in"]));
    } else if (map.containsKey("expiresAt")) {
      expiresAt = DateTime.parse(map["expiresAt"]);
    }
  }
  String accessToken;
  String refreshToken;
  DateTime expiresAt;

  String get authorizationHeaderValue => "Bearer $accessToken";

  bool get isExpired =>
      expiresAt.difference(new DateTime.now()).inSeconds < 0;

  Map<String, dynamic> asMap() =>
      {
        "access_token": accessToken,
        "refresh_token": refreshToken,
        "expiresAt": expiresAt.toIso8601String()
      };
}
