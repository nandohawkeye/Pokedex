// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class IPokemonEntityData extends DataClass
    implements Insertable<IPokemonEntityData> {
  final int id;
  final String name;
  final String url;
  IPokemonEntityData({required this.id, required this.name, required this.url});
  factory IPokemonEntityData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return IPokemonEntityData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      url: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}url'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['url'] = Variable<String>(url);
    return map;
  }

  IPokemonEntityCompanion toCompanion(bool nullToAbsent) {
    return IPokemonEntityCompanion(
      id: Value(id),
      name: Value(name),
      url: Value(url),
    );
  }

  factory IPokemonEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return IPokemonEntityData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      url: serializer.fromJson<String>(json['url']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'url': serializer.toJson<String>(url),
    };
  }

  IPokemonEntityData copyWith({int? id, String? name, String? url}) =>
      IPokemonEntityData(
        id: id ?? this.id,
        name: name ?? this.name,
        url: url ?? this.url,
      );
  @override
  String toString() {
    return (StringBuffer('IPokemonEntityData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('url: $url')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, url);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is IPokemonEntityData &&
          other.id == this.id &&
          other.name == this.name &&
          other.url == this.url);
}

class IPokemonEntityCompanion extends UpdateCompanion<IPokemonEntityData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> url;
  const IPokemonEntityCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.url = const Value.absent(),
  });
  IPokemonEntityCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String url,
  })  : name = Value(name),
        url = Value(url);
  static Insertable<IPokemonEntityData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? url,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (url != null) 'url': url,
    });
  }

  IPokemonEntityCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<String>? url}) {
    return IPokemonEntityCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IPokemonEntityCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('url: $url')
          ..write(')'))
        .toString();
  }
}

class $IPokemonEntityTable extends IPokemonEntity
    with TableInfo<$IPokemonEntityTable, IPokemonEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $IPokemonEntityTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String?> url = GeneratedColumn<String?>(
      'url', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, url];
  @override
  String get aliasedName => _alias ?? 'i_pokemon_entity';
  @override
  String get actualTableName => 'i_pokemon_entity';
  @override
  VerificationContext validateIntegrity(Insertable<IPokemonEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  IPokemonEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return IPokemonEntityData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $IPokemonEntityTable createAlias(String alias) {
    return $IPokemonEntityTable(attachedDatabase, alias);
  }
}

abstract class _$AppDB extends GeneratedDatabase {
  _$AppDB(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $IPokemonEntityTable iPokemonEntity = $IPokemonEntityTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [iPokemonEntity];
}
