/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class PowerReadInterval extends _i1.TableRow {
  PowerReadInterval({
    int? id,
    required this.powerInstallationId,
    required this.intervalInSeconds,
    required this.powerInKilowatts,
  }) : super(id);

  factory PowerReadInterval.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return PowerReadInterval(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      powerInstallationId: serializationManager
          .deserialize<int>(jsonSerialization['powerInstallationId']),
      intervalInSeconds: serializationManager
          .deserialize<int>(jsonSerialization['intervalInSeconds']),
      powerInKilowatts: serializationManager
          .deserialize<int>(jsonSerialization['powerInKilowatts']),
    );
  }

  static final t = PowerReadIntervalTable();

  int powerInstallationId;

  int intervalInSeconds;

  int powerInKilowatts;

  @override
  String get tableName => 'power_read_interval';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'powerInstallationId': powerInstallationId,
      'intervalInSeconds': intervalInSeconds,
      'powerInKilowatts': powerInKilowatts,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'powerInstallationId': powerInstallationId,
      'intervalInSeconds': intervalInSeconds,
      'powerInKilowatts': powerInKilowatts,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'powerInstallationId': powerInstallationId,
      'intervalInSeconds': intervalInSeconds,
      'powerInKilowatts': powerInKilowatts,
    };
  }

  @override
  void setColumn(
    String columnName,
    value,
  ) {
    switch (columnName) {
      case 'id':
        id = value;
        return;
      case 'powerInstallationId':
        powerInstallationId = value;
        return;
      case 'intervalInSeconds':
        intervalInSeconds = value;
        return;
      case 'powerInKilowatts':
        powerInKilowatts = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<PowerReadInterval>> find(
    _i1.Session session, {
    PowerReadIntervalExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<PowerReadInterval>(
      where: where != null ? where(PowerReadInterval.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<PowerReadInterval?> findSingleRow(
    _i1.Session session, {
    PowerReadIntervalExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<PowerReadInterval>(
      where: where != null ? where(PowerReadInterval.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<PowerReadInterval?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<PowerReadInterval>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required PowerReadIntervalExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<PowerReadInterval>(
      where: where(PowerReadInterval.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    PowerReadInterval row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    PowerReadInterval row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    PowerReadInterval row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    PowerReadIntervalExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<PowerReadInterval>(
      where: where != null ? where(PowerReadInterval.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef PowerReadIntervalExpressionBuilder = _i1.Expression Function(
    PowerReadIntervalTable);

class PowerReadIntervalTable extends _i1.Table {
  PowerReadIntervalTable() : super(tableName: 'power_read_interval');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final powerInstallationId = _i1.ColumnInt('powerInstallationId');

  final intervalInSeconds = _i1.ColumnInt('intervalInSeconds');

  final powerInKilowatts = _i1.ColumnInt('powerInKilowatts');

  @override
  List<_i1.Column> get columns => [
        id,
        powerInstallationId,
        intervalInSeconds,
        powerInKilowatts,
      ];
}

@Deprecated('Use PowerReadIntervalTable.t instead.')
PowerReadIntervalTable tPowerReadInterval = PowerReadIntervalTable();
