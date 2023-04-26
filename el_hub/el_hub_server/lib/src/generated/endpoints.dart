/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/login_status_endpoint.dart' as _i2;
import '../endpoints/power_installation.dart' as _i3;
import '../endpoints/power_read_interval.dart' as _i4;
import 'package:el_hub_server/src/generated/power_installation.dart' as _i5;
import 'package:serverpod_auth_server/module.dart' as _i6;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'loginStatus': _i2.LoginStatusEndpoint()
        ..initialize(
          server,
          'loginStatus',
          null,
        ),
      'powerInstallation': _i3.PowerInstallationEndpoint()
        ..initialize(
          server,
          'powerInstallation',
          null,
        ),
      'powerReadInterval': _i4.PowerReadIntervalEndpoint()
        ..initialize(
          server,
          'powerReadInterval',
          null,
        ),
    };
    connectors['loginStatus'] = _i1.EndpointConnector(
      name: 'loginStatus',
      endpoint: endpoints['loginStatus']!,
      methodConnectors: {
        'getUserInfo': _i1.MethodConnector(
          name: 'getUserInfo',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['loginStatus'] as _i2.LoginStatusEndpoint)
                  .getUserInfo(session),
        )
      },
    );
    connectors['powerInstallation'] = _i1.EndpointConnector(
      name: 'powerInstallation',
      endpoint: endpoints['powerInstallation']!,
      methodConnectors: {
        'getUsersPowerInstallations': _i1.MethodConnector(
          name: 'getUsersPowerInstallations',
          params: {
            'getIntervalUntilDateTime': _i1.ParameterDescription(
              name: 'getIntervalUntilDateTime',
              type: _i1.getType<DateTime?>(),
              nullable: true,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['powerInstallation'] as _i3.PowerInstallationEndpoint)
                  .getUsersPowerInstallations(
            session,
            getIntervalUntilDateTime: params['getIntervalUntilDateTime'],
          ),
        ),
        'addUserToPowerInstallation': _i1.MethodConnector(
          name: 'addUserToPowerInstallation',
          params: {
            'powerInstallationId': _i1.ParameterDescription(
              name: 'powerInstallationId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['powerInstallation'] as _i3.PowerInstallationEndpoint)
                  .addUserToPowerInstallation(
            session,
            params['powerInstallationId'],
          ),
        ),
        'createUsersPowerInstallation': _i1.MethodConnector(
          name: 'createUsersPowerInstallation',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['powerInstallation'] as _i3.PowerInstallationEndpoint)
                  .createUsersPowerInstallation(session),
        ),
        'updatePowerInstallation': _i1.MethodConnector(
          name: 'updatePowerInstallation',
          params: {
            'powerInstallation': _i1.ParameterDescription(
              name: 'powerInstallation',
              type: _i1.getType<_i5.PowerInstallation>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['powerInstallation'] as _i3.PowerInstallationEndpoint)
                  .updatePowerInstallation(
            session,
            params['powerInstallation'],
          ),
        ),
      },
    );
    connectors['powerReadInterval'] = _i1.EndpointConnector(
      name: 'powerReadInterval',
      endpoint: endpoints['powerReadInterval']!,
      methodConnectors: {
        'getPowerReadIntervals': _i1.MethodConnector(
          name: 'getPowerReadIntervals',
          params: {
            'powerInstallationId': _i1.ParameterDescription(
              name: 'powerInstallationId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'getIntervalUntilDateTime': _i1.ParameterDescription(
              name: 'getIntervalUntilDateTime',
              type: _i1.getType<DateTime?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['powerReadInterval'] as _i4.PowerReadIntervalEndpoint)
                  .getPowerReadIntervals(
            session,
            params['powerInstallationId'],
            getIntervalUntilDateTime: params['getIntervalUntilDateTime'],
          ),
        )
      },
    );
    modules['serverpod_auth'] = _i6.Endpoints()..initializeEndpoints(server);
  }
}
