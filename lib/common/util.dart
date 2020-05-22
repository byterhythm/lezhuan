import 'dart:math';

import 'package:hashids2/hashids2.dart';

class ShareIdUtil {
  final hashIds = HashIds(
    salt: 'woodpecker salt',
    minHashLength: 6,
    alphabet: 'ABCDEFGHJKLMNOPQRSTUVWXYZ23456789',
  );

  //编码生成6位邀请码
  String encode(int val) {
    final id = hashIds.encode(val);
    return id.toString();
  }

  //解码成对应的ID
  String decode(String code) {
    var id = hashIds.decode(code);
    return id.toString();
  }
}
