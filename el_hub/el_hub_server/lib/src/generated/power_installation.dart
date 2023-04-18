/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod_auth_server/module.dart';
import 'protocol.dart' as _i2;

class PowerInstallation extends _i1.TableRow {
  PowerInstallation({
    int? id,
    required this.name,
    this.type,
    this.owners,
    this.powerReadIntervals,
  }) : super(id);

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

  static final t = PowerInstallationTable();

  String name;

  String? type;

  List<UserInfo>? owners;

  List<_i2.PowerReadInterval>? powerReadIntervals;

  @override
  String get tableName => 'power_installation';
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

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'owners': owners,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'owners': owners,
      'powerReadIntervals': powerReadIntervals,
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
      case 'name':
        name = value;
        return;
      case 'type':
        type = value;
        return;
      case 'owners':
        owners = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<PowerInstallation>> find(
    _i1.Session session, {
    PowerInstallationExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<PowerInstallation>(
      where: where != null ? where(PowerInstallation.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<PowerInstallation?> findSingleRow(
    _i1.Session session, {
    PowerInstallationExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<PowerInstallation>(
      where: where != null ? where(PowerInstallation.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<PowerInstallation?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<PowerInstallation>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required PowerInstallationExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<PowerInstallation>(
      where: where(PowerInstallation.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    PowerInstallation row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    PowerInstallation row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    PowerInstallation row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    PowerInstallationExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<PowerInstallation>(
      where: where != null ? where(PowerInstallation.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef PowerInstallationExpressionBuilder = _i1.Expression Function(
    PowerInstallationTable);

class PowerInstallationTable extends _i1.Table {
  PowerInstallationTable() : super(tableName: 'power_installation');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final name = _i1.ColumnString('name');

  final type = _i1.ColumnString('type');

  final owners = _i1.ColumnSerializable('owners');

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        type,
        owners,
      ];
}

@Deprecated('Use PowerInstallationTable.t instead.')
PowerInstallationTable tPowerInstallation = PowerInstallationTable();
