/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

class PowerReadInterval extends _i1.SerializableEntity {
  PowerReadInterval({
    this.id,
    required this.powerInstallationId,
    required this.lengthInSeconds,
    required this.powerInKilowatts,
    required this.powerReadIntervalStart,
    required this.powerReadIntervalEnd,
  });

  factory PowerReadInterval.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return PowerReadInterval(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      powerInstallationId: serializationManager
          .deserialize<int>(jsonSerialization['powerInstallationId']),
      lengthInSeconds: serializationManager
          .deserialize<int>(jsonSerialization['lengthInSeconds']),
      powerInKilowatts: serializationManager
          .deserialize<int>(jsonSerialization['powerInKilowatts']),
      powerReadIntervalStart: serializationManager
          .deserialize<DateTime>(jsonSerialization['powerReadIntervalStart']),
      powerReadIntervalEnd: serializationManager
          .deserialize<DateTime>(jsonSerialization['powerReadIntervalEnd']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int powerInstallationId;

  int lengthInSeconds;

  int powerInKilowatts;

  DateTime powerReadIntervalStart;

  DateTime powerReadIntervalEnd;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'powerInstallationId': powerInstallationId,
      'lengthInSeconds': lengthInSeconds,
      'powerInKilowatts': powerInKilowatts,
      'powerReadIntervalStart': powerReadIntervalStart,
      'powerReadIntervalEnd': powerReadIntervalEnd,
    };
  }
}
