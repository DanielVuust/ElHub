import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/module.dart';
import '../generated/protocol.dart';

class LoginStatusEndpoint extends Endpoint {
  Future<UserInfo> getUserInfo(Session session) async {
    int? userId = await session.auth.authenticatedUserId;
      if (userId == null) {
        throw Exception('User not found');
      }
      var userInfo = await Users.findUserByUserId(session, userId);
      if (userInfo == null) {
        throw Exception('User not found');
      }
      return userInfo;
  }
}
