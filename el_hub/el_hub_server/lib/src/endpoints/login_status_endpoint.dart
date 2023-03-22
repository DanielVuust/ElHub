import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class LoginStatusEndpoint extends Endpoint {
  Future<bool> logoutUser(Session session) async {
    try {
      session.auth.signOutUser();
    } catch (e) {
      return false;
    }
    return true;
  }

  Future<bool> isUserLoggedIn(Session session) async {
    try {
      if(await session.auth.authenticatedUserId == null){
        return false;
      }
    } catch (e) {
      return false;
    }
    return true;
  }
}
