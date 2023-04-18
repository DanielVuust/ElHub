/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_auth_client/module.dart';
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'protocol.dart' as _i2;

class PowerInstallation extends _i1.SerializableEntity {
  PowerInstallation({
    this.id,
    required this.name,
    this.type,
    this.owners,
    this.powerReadIntervals,
  });

  factory PowerInstallation.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return PowerInstallation(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      name: serializationManager.deserialize<String>(jsonSerialization['name']),
      type:
          serializationManager.deserialize<String?>(jsonSerialization['type']),
      owners: serializationManager
          .deserialize<List<UserInfo>?>(jsonSerialization['owners']),
      powerReadIntervals:
          serializationManager.deserialize<List<_i2.PowerReadInterval>?>(
              jsonSerialization['powerReadIntervals']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  String? type;

  List<UserInfo>? owners;

  List<_i2.PowerReadInterval>? powerReadIntervals;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'owners': owners,
      'powerReadIntervals': powerReadIntervals,
    };
  }
}
