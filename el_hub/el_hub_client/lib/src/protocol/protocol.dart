/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_auth_client/module.dart';
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'power_installation.dart' as _i2;
import 'power_read_interval.dart' as _i3;
import 'test.dart' as _i4;
import 'user.dart' as _i5;
import 'protocol.dart' as _i6;
import 'package:el_hub_client/src/protocol/power_installation.dart' as _i7;
import 'package:el_hub_client/src/protocol/power_read_interval.dart' as _i8;
import 'package:serverpod_auth_client/module.dart' as _i9;
export 'power_installation.dart';
export 'power_read_interval.dart';
export 'test.dart';
export 'user.dart';
export 'client.dart'; // ignore_for_file: equal_keys_in_map

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Map<Type, _i1.constructor> customConstructors = {};

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (customConstructors.containsKey(t)) {
      return customConstructors[t]!(data, this) as T;
    }
    if (t == _i2.PowerInstallation) {
      return _i2.PowerInstallation.fromJson(data, this) as T;
    }
    if (t == _i3.PowerReadInterval) {
      return _i3.PowerReadInterval.fromJson(data, this) as T;
    }
    if (t == _i4.ServerpodEmailAuth) {
      return _i4.ServerpodEmailAuth.fromJson(data, this) as T;
    }
    if (t == _i5.User) {
      return _i5.User.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i2.PowerInstallation?>()) {
      return (data != null ? _i2.PowerInstallation.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i3.PowerReadInterval?>()) {
      return (data != null ? _i3.PowerReadInterval.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i4.ServerpodEmailAuth?>()) {
      return (data != null ? _i4.ServerpodEmailAuth.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i5.User?>()) {
      return (data != null ? _i5.User.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<List<UserInfo>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<UserInfo>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i6.PowerReadInterval>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i6.PowerReadInterval>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == List<_i7.PowerInstallation>) {
      return (data as List)
          .map((e) => deserialize<_i7.PowerInstallation>(e))
          .toList() as dynamic;
    }
    if (t == List<_i8.PowerReadInterval>) {
      return (data as List)
          .map((e) => deserialize<_i8.PowerReadInterval>(e))
          .toList() as dynamic;
    }
    try {
      return _i9.Protocol().deserialize<T>(data, t);
    } catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    String? className;
    className = _i9.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    if (data is _i2.PowerInstallation) {
      return 'PowerInstallation';
    }
    if (data is _i3.PowerReadInterval) {
      return 'PowerReadInterval';
    }
    if (data is _i4.ServerpodEmailAuth) {
      return 'ServerpodEmailAuth';
    }
    if (data is _i5.User) {
      return 'User';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'].startsWith('serverpod_auth.')) {
      data['className'] = data['className'].substring(15);
      return _i9.Protocol().deserializeByClassName(data);
    }
    if (data['className'] == 'PowerInstallation') {
      return deserialize<_i2.PowerInstallation>(data['data']);
    }
    if (data['className'] == 'PowerReadInterval') {
      return deserialize<_i3.PowerReadInterval>(data['data']);
    }
    if (data['className'] == 'ServerpodEmailAuth') {
      return deserialize<_i4.ServerpodEmailAuth>(data['data']);
    }
    if (data['className'] == 'User') {
      return deserialize<_i5.User>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
