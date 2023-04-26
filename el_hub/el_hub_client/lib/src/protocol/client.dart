/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:serverpod_auth_client/module.dart' as _i3;
import 'package:el_hub_client/src/protocol/power_installation.dart' as _i4;
import 'package:el_hub_client/src/protocol/power_read_interval.dart' as _i5;
import 'dart:io' as _i6;
import 'protocol.dart' as _i7;

class _EndpointLoginStatus extends _i1.EndpointRef {
  _EndpointLoginStatus(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'loginStatus';

  _i2.Future<_i3.UserInfo> getUserInfo() =>
      caller.callServerEndpoint<_i3.UserInfo>(
        'loginStatus',
        'getUserInfo',
        {},
      );
}

class _EndpointPowerInstallation extends _i1.EndpointRef {
  _EndpointPowerInstallation(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'powerInstallation';

  _i2.Future<List<_i4.PowerInstallation>> getUsersPowerInstallations(
          {DateTime? getIntervalUntilDateTime}) =>
      caller.callServerEndpoint<List<_i4.PowerInstallation>>(
        'powerInstallation',
        'getUsersPowerInstallations',
        {'getIntervalUntilDateTime': getIntervalUntilDateTime},
      );

  _i2.Future<void> addUserToPowerInstallation(int powerInstallationId) =>
      caller.callServerEndpoint<void>(
        'powerInstallation',
        'addUserToPowerInstallation',
        {'powerInstallationId': powerInstallationId},
      );

  _i2.Future<void> createUsersPowerInstallation() =>
      caller.callServerEndpoint<void>(
        'powerInstallation',
        'createUsersPowerInstallation',
        {},
      );

  _i2.Future<void> updatePowerInstallation(
          _i4.PowerInstallation powerInstallation) =>
      caller.callServerEndpoint<void>(
        'powerInstallation',
        'updatePowerInstallation',
        {'powerInstallation': powerInstallation},
      );
}

class _EndpointPowerReadInterval extends _i1.EndpointRef {
  _EndpointPowerReadInterval(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'powerReadInterval';

  _i2.Future<List<_i5.PowerReadInterval>> getPowerReadIntervals(
    int powerInstallationId, {
    DateTime? getIntervalUntilDateTime,
  }) =>
      caller.callServerEndpoint<List<_i5.PowerReadInterval>>(
        'powerReadInterval',
        'getPowerReadIntervals',
        {
          'powerInstallationId': powerInstallationId,
          'getIntervalUntilDateTime': getIntervalUntilDateTime,
        },
      );
}

class _Modules {
  _Modules(Client client) {
    auth = _i3.Caller(client);
  }

  late final _i3.Caller auth;
}

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    _i6.SecurityContext? context,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
  }) : super(
          host,
          _i7.Protocol(),
          context: context,
          authenticationKeyManager: authenticationKeyManager,
        ) {
    loginStatus = _EndpointLoginStatus(this);
    powerInstallation = _EndpointPowerInstallation(this);
    powerReadInterval = _EndpointPowerReadInterval(this);
    modules = _Modules(this);
  }

  late final _EndpointLoginStatus loginStatus;

  late final _EndpointPowerInstallation powerInstallation;

  late final _EndpointPowerReadInterval powerReadInterval;

  late final _Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'loginStatus': loginStatus,
        'powerInstallation': powerInstallation,
        'powerReadInterval': powerReadInterval,
      };
  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}
