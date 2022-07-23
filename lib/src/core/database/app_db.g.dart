// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class PokemonDetail extends DataClass implements Insertable<PokemonDetail> {
  final int id;
  final String name;
  final int? height;
  final int? weight;
  final int? experience;
  final String? imageUrl;
  final String? animationFront;
  final String? animationBack;
  PokemonDetail(
      {required this.id,
      required this.name,
      this.height,
      this.weight,
      this.experience,
      this.imageUrl,
      this.animationFront,
      this.animationBack});
  factory PokemonDetail.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return PokemonDetail(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      height: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}height']),
      weight: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}weight']),
      experience: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}experience']),
      imageUrl: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}image_url']),
      animationFront: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}animation_front']),
      animationBack: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}animation_back']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || height != null) {
      map['height'] = Variable<int?>(height);
    }
    if (!nullToAbsent || weight != null) {
      map['weight'] = Variable<int?>(weight);
    }
    if (!nullToAbsent || experience != null) {
      map['experience'] = Variable<int?>(experience);
    }
    if (!nullToAbsent || imageUrl != null) {
      map['image_url'] = Variable<String?>(imageUrl);
    }
    if (!nullToAbsent || animationFront != null) {
      map['animation_front'] = Variable<String?>(animationFront);
    }
    if (!nullToAbsent || animationBack != null) {
      map['animation_back'] = Variable<String?>(animationBack);
    }
    return map;
  }

  IPokemonDetailsEntityCompanion toCompanion(bool nullToAbsent) {
    return IPokemonDetailsEntityCompanion(
      id: Value(id),
      name: Value(name),
      height:
          height == null && nullToAbsent ? const Value.absent() : Value(height),
      weight:
          weight == null && nullToAbsent ? const Value.absent() : Value(weight),
      experience: experience == null && nullToAbsent
          ? const Value.absent()
          : Value(experience),
      imageUrl: imageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(imageUrl),
      animationFront: animationFront == null && nullToAbsent
          ? const Value.absent()
          : Value(animationFront),
      animationBack: animationBack == null && nullToAbsent
          ? const Value.absent()
          : Value(animationBack),
    );
  }

  factory PokemonDetail.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PokemonDetail(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      height: serializer.fromJson<int?>(json['height']),
      weight: serializer.fromJson<int?>(json['weight']),
      experience: serializer.fromJson<int?>(json['experience']),
      imageUrl: serializer.fromJson<String?>(json['imageUrl']),
      animationFront: serializer.fromJson<String?>(json['animationFront']),
      animationBack: serializer.fromJson<String?>(json['animationBack']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'height': serializer.toJson<int?>(height),
      'weight': serializer.toJson<int?>(weight),
      'experience': serializer.toJson<int?>(experience),
      'imageUrl': serializer.toJson<String?>(imageUrl),
      'animationFront': serializer.toJson<String?>(animationFront),
      'animationBack': serializer.toJson<String?>(animationBack),
    };
  }

  PokemonDetail copyWith(
          {int? id,
          String? name,
          int? height,
          int? weight,
          int? experience,
          String? imageUrl,
          String? animationFront,
          String? animationBack}) =>
      PokemonDetail(
        id: id ?? this.id,
        name: name ?? this.name,
        height: height ?? this.height,
        weight: weight ?? this.weight,
        experience: experience ?? this.experience,
        imageUrl: imageUrl ?? this.imageUrl,
        animationFront: animationFront ?? this.animationFront,
        animationBack: animationBack ?? this.animationBack,
      );
  @override
  String toString() {
    return (StringBuffer('PokemonDetail(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('height: $height, ')
          ..write('weight: $weight, ')
          ..write('experience: $experience, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('animationFront: $animationFront, ')
          ..write('animationBack: $animationBack')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, height, weight, experience,
      imageUrl, animationFront, animationBack);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PokemonDetail &&
          other.id == this.id &&
          other.name == this.name &&
          other.height == this.height &&
          other.weight == this.weight &&
          other.experience == this.experience &&
          other.imageUrl == this.imageUrl &&
          other.animationFront == this.animationFront &&
          other.animationBack == this.animationBack);
}

class IPokemonDetailsEntityCompanion extends UpdateCompanion<PokemonDetail> {
  final Value<int> id;
  final Value<String> name;
  final Value<int?> height;
  final Value<int?> weight;
  final Value<int?> experience;
  final Value<String?> imageUrl;
  final Value<String?> animationFront;
  final Value<String?> animationBack;
  const IPokemonDetailsEntityCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.height = const Value.absent(),
    this.weight = const Value.absent(),
    this.experience = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.animationFront = const Value.absent(),
    this.animationBack = const Value.absent(),
  });
  IPokemonDetailsEntityCompanion.insert({
    required int id,
    required String name,
    this.height = const Value.absent(),
    this.weight = const Value.absent(),
    this.experience = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.animationFront = const Value.absent(),
    this.animationBack = const Value.absent(),
  })  : id = Value(id),
        name = Value(name);
  static Insertable<PokemonDetail> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int?>? height,
    Expression<int?>? weight,
    Expression<int?>? experience,
    Expression<String?>? imageUrl,
    Expression<String?>? animationFront,
    Expression<String?>? animationBack,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (height != null) 'height': height,
      if (weight != null) 'weight': weight,
      if (experience != null) 'experience': experience,
      if (imageUrl != null) 'image_url': imageUrl,
      if (animationFront != null) 'animation_front': animationFront,
      if (animationBack != null) 'animation_back': animationBack,
    });
  }

  IPokemonDetailsEntityCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int?>? height,
      Value<int?>? weight,
      Value<int?>? experience,
      Value<String?>? imageUrl,
      Value<String?>? animationFront,
      Value<String?>? animationBack}) {
    return IPokemonDetailsEntityCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      experience: experience ?? this.experience,
      imageUrl: imageUrl ?? this.imageUrl,
      animationFront: animationFront ?? this.animationFront,
      animationBack: animationBack ?? this.animationBack,
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
    if (height.present) {
      map['height'] = Variable<int?>(height.value);
    }
    if (weight.present) {
      map['weight'] = Variable<int?>(weight.value);
    }
    if (experience.present) {
      map['experience'] = Variable<int?>(experience.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String?>(imageUrl.value);
    }
    if (animationFront.present) {
      map['animation_front'] = Variable<String?>(animationFront.value);
    }
    if (animationBack.present) {
      map['animation_back'] = Variable<String?>(animationBack.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IPokemonDetailsEntityCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('height: $height, ')
          ..write('weight: $weight, ')
          ..write('experience: $experience, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('animationFront: $animationFront, ')
          ..write('animationBack: $animationBack')
          ..write(')'))
        .toString();
  }
}

class $IPokemonDetailsEntityTable extends IPokemonDetailsEntity
    with TableInfo<$IPokemonDetailsEntityTable, PokemonDetail> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $IPokemonDetailsEntityTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _heightMeta = const VerificationMeta('height');
  @override
  late final GeneratedColumn<int?> height = GeneratedColumn<int?>(
      'height', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<int?> weight = GeneratedColumn<int?>(
      'weight', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _experienceMeta = const VerificationMeta('experience');
  @override
  late final GeneratedColumn<int?> experience = GeneratedColumn<int?>(
      'experience', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _imageUrlMeta = const VerificationMeta('imageUrl');
  @override
  late final GeneratedColumn<String?> imageUrl = GeneratedColumn<String?>(
      'image_url', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _animationFrontMeta =
      const VerificationMeta('animationFront');
  @override
  late final GeneratedColumn<String?> animationFront = GeneratedColumn<String?>(
      'animation_front', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _animationBackMeta =
      const VerificationMeta('animationBack');
  @override
  late final GeneratedColumn<String?> animationBack = GeneratedColumn<String?>(
      'animation_back', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        height,
        weight,
        experience,
        imageUrl,
        animationFront,
        animationBack
      ];
  @override
  String get aliasedName => _alias ?? 'i_pokemon_details_entity';
  @override
  String get actualTableName => 'i_pokemon_details_entity';
  @override
  VerificationContext validateIntegrity(Insertable<PokemonDetail> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('height')) {
      context.handle(_heightMeta,
          height.isAcceptableOrUnknown(data['height']!, _heightMeta));
    }
    if (data.containsKey('weight')) {
      context.handle(_weightMeta,
          weight.isAcceptableOrUnknown(data['weight']!, _weightMeta));
    }
    if (data.containsKey('experience')) {
      context.handle(
          _experienceMeta,
          experience.isAcceptableOrUnknown(
              data['experience']!, _experienceMeta));
    }
    if (data.containsKey('image_url')) {
      context.handle(_imageUrlMeta,
          imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta));
    }
    if (data.containsKey('animation_front')) {
      context.handle(
          _animationFrontMeta,
          animationFront.isAcceptableOrUnknown(
              data['animation_front']!, _animationFrontMeta));
    }
    if (data.containsKey('animation_back')) {
      context.handle(
          _animationBackMeta,
          animationBack.isAcceptableOrUnknown(
              data['animation_back']!, _animationBackMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  PokemonDetail map(Map<String, dynamic> data, {String? tablePrefix}) {
    return PokemonDetail.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $IPokemonDetailsEntityTable createAlias(String alias) {
    return $IPokemonDetailsEntityTable(attachedDatabase, alias);
  }
}

class PokemonAbility extends DataClass implements Insertable<PokemonAbility> {
  final String? pokemonName;
  final String? name;
  final bool? isHidden;
  final int id;
  PokemonAbility(
      {this.pokemonName, this.name, this.isHidden, required this.id});
  factory PokemonAbility.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return PokemonAbility(
      pokemonName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}pokemon_name']),
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name']),
      isHidden: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_hidden']),
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || pokemonName != null) {
      map['pokemon_name'] = Variable<String?>(pokemonName);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String?>(name);
    }
    if (!nullToAbsent || isHidden != null) {
      map['is_hidden'] = Variable<bool?>(isHidden);
    }
    map['id'] = Variable<int>(id);
    return map;
  }

  IPokemonAbilitiesEntityCompanion toCompanion(bool nullToAbsent) {
    return IPokemonAbilitiesEntityCompanion(
      pokemonName: pokemonName == null && nullToAbsent
          ? const Value.absent()
          : Value(pokemonName),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      isHidden: isHidden == null && nullToAbsent
          ? const Value.absent()
          : Value(isHidden),
      id: Value(id),
    );
  }

  factory PokemonAbility.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PokemonAbility(
      pokemonName: serializer.fromJson<String?>(json['pokemonName']),
      name: serializer.fromJson<String?>(json['name']),
      isHidden: serializer.fromJson<bool?>(json['isHidden']),
      id: serializer.fromJson<int>(json['id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'pokemonName': serializer.toJson<String?>(pokemonName),
      'name': serializer.toJson<String?>(name),
      'isHidden': serializer.toJson<bool?>(isHidden),
      'id': serializer.toJson<int>(id),
    };
  }

  PokemonAbility copyWith(
          {String? pokemonName, String? name, bool? isHidden, int? id}) =>
      PokemonAbility(
        pokemonName: pokemonName ?? this.pokemonName,
        name: name ?? this.name,
        isHidden: isHidden ?? this.isHidden,
        id: id ?? this.id,
      );
  @override
  String toString() {
    return (StringBuffer('PokemonAbility(')
          ..write('pokemonName: $pokemonName, ')
          ..write('name: $name, ')
          ..write('isHidden: $isHidden, ')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(pokemonName, name, isHidden, id);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PokemonAbility &&
          other.pokemonName == this.pokemonName &&
          other.name == this.name &&
          other.isHidden == this.isHidden &&
          other.id == this.id);
}

class IPokemonAbilitiesEntityCompanion extends UpdateCompanion<PokemonAbility> {
  final Value<String?> pokemonName;
  final Value<String?> name;
  final Value<bool?> isHidden;
  final Value<int> id;
  const IPokemonAbilitiesEntityCompanion({
    this.pokemonName = const Value.absent(),
    this.name = const Value.absent(),
    this.isHidden = const Value.absent(),
    this.id = const Value.absent(),
  });
  IPokemonAbilitiesEntityCompanion.insert({
    this.pokemonName = const Value.absent(),
    this.name = const Value.absent(),
    this.isHidden = const Value.absent(),
    this.id = const Value.absent(),
  });
  static Insertable<PokemonAbility> custom({
    Expression<String?>? pokemonName,
    Expression<String?>? name,
    Expression<bool?>? isHidden,
    Expression<int>? id,
  }) {
    return RawValuesInsertable({
      if (pokemonName != null) 'pokemon_name': pokemonName,
      if (name != null) 'name': name,
      if (isHidden != null) 'is_hidden': isHidden,
      if (id != null) 'id': id,
    });
  }

  IPokemonAbilitiesEntityCompanion copyWith(
      {Value<String?>? pokemonName,
      Value<String?>? name,
      Value<bool?>? isHidden,
      Value<int>? id}) {
    return IPokemonAbilitiesEntityCompanion(
      pokemonName: pokemonName ?? this.pokemonName,
      name: name ?? this.name,
      isHidden: isHidden ?? this.isHidden,
      id: id ?? this.id,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (pokemonName.present) {
      map['pokemon_name'] = Variable<String?>(pokemonName.value);
    }
    if (name.present) {
      map['name'] = Variable<String?>(name.value);
    }
    if (isHidden.present) {
      map['is_hidden'] = Variable<bool?>(isHidden.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IPokemonAbilitiesEntityCompanion(')
          ..write('pokemonName: $pokemonName, ')
          ..write('name: $name, ')
          ..write('isHidden: $isHidden, ')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }
}

class $IPokemonAbilitiesEntityTable extends IPokemonAbilitiesEntity
    with TableInfo<$IPokemonAbilitiesEntityTable, PokemonAbility> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $IPokemonAbilitiesEntityTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _pokemonNameMeta =
      const VerificationMeta('pokemonName');
  @override
  late final GeneratedColumn<String?> pokemonName = GeneratedColumn<String?>(
      'pokemon_name', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _isHiddenMeta = const VerificationMeta('isHidden');
  @override
  late final GeneratedColumn<bool?> isHidden = GeneratedColumn<bool?>(
      'is_hidden', aliasedName, true,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (is_hidden IN (0, 1))');
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  @override
  List<GeneratedColumn> get $columns => [pokemonName, name, isHidden, id];
  @override
  String get aliasedName => _alias ?? 'i_pokemon_abilities_entity';
  @override
  String get actualTableName => 'i_pokemon_abilities_entity';
  @override
  VerificationContext validateIntegrity(Insertable<PokemonAbility> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('pokemon_name')) {
      context.handle(
          _pokemonNameMeta,
          pokemonName.isAcceptableOrUnknown(
              data['pokemon_name']!, _pokemonNameMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('is_hidden')) {
      context.handle(_isHiddenMeta,
          isHidden.isAcceptableOrUnknown(data['is_hidden']!, _isHiddenMeta));
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PokemonAbility map(Map<String, dynamic> data, {String? tablePrefix}) {
    return PokemonAbility.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $IPokemonAbilitiesEntityTable createAlias(String alias) {
    return $IPokemonAbilitiesEntityTable(attachedDatabase, alias);
  }
}

class PokemonMove extends DataClass implements Insertable<PokemonMove> {
  final String? pokemonName;
  final String? name;
  final int id;
  PokemonMove({this.pokemonName, this.name, required this.id});
  factory PokemonMove.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return PokemonMove(
      pokemonName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}pokemon_name']),
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name']),
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || pokemonName != null) {
      map['pokemon_name'] = Variable<String?>(pokemonName);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String?>(name);
    }
    map['id'] = Variable<int>(id);
    return map;
  }

  IPokemonMoveEntityCompanion toCompanion(bool nullToAbsent) {
    return IPokemonMoveEntityCompanion(
      pokemonName: pokemonName == null && nullToAbsent
          ? const Value.absent()
          : Value(pokemonName),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      id: Value(id),
    );
  }

  factory PokemonMove.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PokemonMove(
      pokemonName: serializer.fromJson<String?>(json['pokemonName']),
      name: serializer.fromJson<String?>(json['name']),
      id: serializer.fromJson<int>(json['id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'pokemonName': serializer.toJson<String?>(pokemonName),
      'name': serializer.toJson<String?>(name),
      'id': serializer.toJson<int>(id),
    };
  }

  PokemonMove copyWith({String? pokemonName, String? name, int? id}) =>
      PokemonMove(
        pokemonName: pokemonName ?? this.pokemonName,
        name: name ?? this.name,
        id: id ?? this.id,
      );
  @override
  String toString() {
    return (StringBuffer('PokemonMove(')
          ..write('pokemonName: $pokemonName, ')
          ..write('name: $name, ')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(pokemonName, name, id);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PokemonMove &&
          other.pokemonName == this.pokemonName &&
          other.name == this.name &&
          other.id == this.id);
}

class IPokemonMoveEntityCompanion extends UpdateCompanion<PokemonMove> {
  final Value<String?> pokemonName;
  final Value<String?> name;
  final Value<int> id;
  const IPokemonMoveEntityCompanion({
    this.pokemonName = const Value.absent(),
    this.name = const Value.absent(),
    this.id = const Value.absent(),
  });
  IPokemonMoveEntityCompanion.insert({
    this.pokemonName = const Value.absent(),
    this.name = const Value.absent(),
    this.id = const Value.absent(),
  });
  static Insertable<PokemonMove> custom({
    Expression<String?>? pokemonName,
    Expression<String?>? name,
    Expression<int>? id,
  }) {
    return RawValuesInsertable({
      if (pokemonName != null) 'pokemon_name': pokemonName,
      if (name != null) 'name': name,
      if (id != null) 'id': id,
    });
  }

  IPokemonMoveEntityCompanion copyWith(
      {Value<String?>? pokemonName, Value<String?>? name, Value<int>? id}) {
    return IPokemonMoveEntityCompanion(
      pokemonName: pokemonName ?? this.pokemonName,
      name: name ?? this.name,
      id: id ?? this.id,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (pokemonName.present) {
      map['pokemon_name'] = Variable<String?>(pokemonName.value);
    }
    if (name.present) {
      map['name'] = Variable<String?>(name.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IPokemonMoveEntityCompanion(')
          ..write('pokemonName: $pokemonName, ')
          ..write('name: $name, ')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }
}

class $IPokemonMoveEntityTable extends IPokemonMoveEntity
    with TableInfo<$IPokemonMoveEntityTable, PokemonMove> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $IPokemonMoveEntityTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _pokemonNameMeta =
      const VerificationMeta('pokemonName');
  @override
  late final GeneratedColumn<String?> pokemonName = GeneratedColumn<String?>(
      'pokemon_name', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  @override
  List<GeneratedColumn> get $columns => [pokemonName, name, id];
  @override
  String get aliasedName => _alias ?? 'i_pokemon_move_entity';
  @override
  String get actualTableName => 'i_pokemon_move_entity';
  @override
  VerificationContext validateIntegrity(Insertable<PokemonMove> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('pokemon_name')) {
      context.handle(
          _pokemonNameMeta,
          pokemonName.isAcceptableOrUnknown(
              data['pokemon_name']!, _pokemonNameMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PokemonMove map(Map<String, dynamic> data, {String? tablePrefix}) {
    return PokemonMove.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $IPokemonMoveEntityTable createAlias(String alias) {
    return $IPokemonMoveEntityTable(attachedDatabase, alias);
  }
}

class PokemonType extends DataClass implements Insertable<PokemonType> {
  final String? pokemonName;
  final String? name;
  final int id;
  PokemonType({this.pokemonName, this.name, required this.id});
  factory PokemonType.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return PokemonType(
      pokemonName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}pokemon_name']),
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name']),
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || pokemonName != null) {
      map['pokemon_name'] = Variable<String?>(pokemonName);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String?>(name);
    }
    map['id'] = Variable<int>(id);
    return map;
  }

  IPokemonTypeEntityCompanion toCompanion(bool nullToAbsent) {
    return IPokemonTypeEntityCompanion(
      pokemonName: pokemonName == null && nullToAbsent
          ? const Value.absent()
          : Value(pokemonName),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      id: Value(id),
    );
  }

  factory PokemonType.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PokemonType(
      pokemonName: serializer.fromJson<String?>(json['pokemonName']),
      name: serializer.fromJson<String?>(json['name']),
      id: serializer.fromJson<int>(json['id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'pokemonName': serializer.toJson<String?>(pokemonName),
      'name': serializer.toJson<String?>(name),
      'id': serializer.toJson<int>(id),
    };
  }

  PokemonType copyWith({String? pokemonName, String? name, int? id}) =>
      PokemonType(
        pokemonName: pokemonName ?? this.pokemonName,
        name: name ?? this.name,
        id: id ?? this.id,
      );
  @override
  String toString() {
    return (StringBuffer('PokemonType(')
          ..write('pokemonName: $pokemonName, ')
          ..write('name: $name, ')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(pokemonName, name, id);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PokemonType &&
          other.pokemonName == this.pokemonName &&
          other.name == this.name &&
          other.id == this.id);
}

class IPokemonTypeEntityCompanion extends UpdateCompanion<PokemonType> {
  final Value<String?> pokemonName;
  final Value<String?> name;
  final Value<int> id;
  const IPokemonTypeEntityCompanion({
    this.pokemonName = const Value.absent(),
    this.name = const Value.absent(),
    this.id = const Value.absent(),
  });
  IPokemonTypeEntityCompanion.insert({
    this.pokemonName = const Value.absent(),
    this.name = const Value.absent(),
    this.id = const Value.absent(),
  });
  static Insertable<PokemonType> custom({
    Expression<String?>? pokemonName,
    Expression<String?>? name,
    Expression<int>? id,
  }) {
    return RawValuesInsertable({
      if (pokemonName != null) 'pokemon_name': pokemonName,
      if (name != null) 'name': name,
      if (id != null) 'id': id,
    });
  }

  IPokemonTypeEntityCompanion copyWith(
      {Value<String?>? pokemonName, Value<String?>? name, Value<int>? id}) {
    return IPokemonTypeEntityCompanion(
      pokemonName: pokemonName ?? this.pokemonName,
      name: name ?? this.name,
      id: id ?? this.id,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (pokemonName.present) {
      map['pokemon_name'] = Variable<String?>(pokemonName.value);
    }
    if (name.present) {
      map['name'] = Variable<String?>(name.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IPokemonTypeEntityCompanion(')
          ..write('pokemonName: $pokemonName, ')
          ..write('name: $name, ')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }
}

class $IPokemonTypeEntityTable extends IPokemonTypeEntity
    with TableInfo<$IPokemonTypeEntityTable, PokemonType> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $IPokemonTypeEntityTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _pokemonNameMeta =
      const VerificationMeta('pokemonName');
  @override
  late final GeneratedColumn<String?> pokemonName = GeneratedColumn<String?>(
      'pokemon_name', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  @override
  List<GeneratedColumn> get $columns => [pokemonName, name, id];
  @override
  String get aliasedName => _alias ?? 'i_pokemon_type_entity';
  @override
  String get actualTableName => 'i_pokemon_type_entity';
  @override
  VerificationContext validateIntegrity(Insertable<PokemonType> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('pokemon_name')) {
      context.handle(
          _pokemonNameMeta,
          pokemonName.isAcceptableOrUnknown(
              data['pokemon_name']!, _pokemonNameMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PokemonType map(Map<String, dynamic> data, {String? tablePrefix}) {
    return PokemonType.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $IPokemonTypeEntityTable createAlias(String alias) {
    return $IPokemonTypeEntityTable(attachedDatabase, alias);
  }
}

class PokemonStat extends DataClass implements Insertable<PokemonStat> {
  final String? pokemonName;
  final String? name;
  final int id;
  final int? baseStat;
  final int? effort;
  PokemonStat(
      {this.pokemonName,
      this.name,
      required this.id,
      this.baseStat,
      this.effort});
  factory PokemonStat.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return PokemonStat(
      pokemonName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}pokemon_name']),
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name']),
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      baseStat: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}base_stat']),
      effort: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}effort']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || pokemonName != null) {
      map['pokemon_name'] = Variable<String?>(pokemonName);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String?>(name);
    }
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || baseStat != null) {
      map['base_stat'] = Variable<int?>(baseStat);
    }
    if (!nullToAbsent || effort != null) {
      map['effort'] = Variable<int?>(effort);
    }
    return map;
  }

  IPokemonStatsEntityCompanion toCompanion(bool nullToAbsent) {
    return IPokemonStatsEntityCompanion(
      pokemonName: pokemonName == null && nullToAbsent
          ? const Value.absent()
          : Value(pokemonName),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      id: Value(id),
      baseStat: baseStat == null && nullToAbsent
          ? const Value.absent()
          : Value(baseStat),
      effort:
          effort == null && nullToAbsent ? const Value.absent() : Value(effort),
    );
  }

  factory PokemonStat.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PokemonStat(
      pokemonName: serializer.fromJson<String?>(json['pokemonName']),
      name: serializer.fromJson<String?>(json['name']),
      id: serializer.fromJson<int>(json['id']),
      baseStat: serializer.fromJson<int?>(json['baseStat']),
      effort: serializer.fromJson<int?>(json['effort']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'pokemonName': serializer.toJson<String?>(pokemonName),
      'name': serializer.toJson<String?>(name),
      'id': serializer.toJson<int>(id),
      'baseStat': serializer.toJson<int?>(baseStat),
      'effort': serializer.toJson<int?>(effort),
    };
  }

  PokemonStat copyWith(
          {String? pokemonName,
          String? name,
          int? id,
          int? baseStat,
          int? effort}) =>
      PokemonStat(
        pokemonName: pokemonName ?? this.pokemonName,
        name: name ?? this.name,
        id: id ?? this.id,
        baseStat: baseStat ?? this.baseStat,
        effort: effort ?? this.effort,
      );
  @override
  String toString() {
    return (StringBuffer('PokemonStat(')
          ..write('pokemonName: $pokemonName, ')
          ..write('name: $name, ')
          ..write('id: $id, ')
          ..write('baseStat: $baseStat, ')
          ..write('effort: $effort')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(pokemonName, name, id, baseStat, effort);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PokemonStat &&
          other.pokemonName == this.pokemonName &&
          other.name == this.name &&
          other.id == this.id &&
          other.baseStat == this.baseStat &&
          other.effort == this.effort);
}

class IPokemonStatsEntityCompanion extends UpdateCompanion<PokemonStat> {
  final Value<String?> pokemonName;
  final Value<String?> name;
  final Value<int> id;
  final Value<int?> baseStat;
  final Value<int?> effort;
  const IPokemonStatsEntityCompanion({
    this.pokemonName = const Value.absent(),
    this.name = const Value.absent(),
    this.id = const Value.absent(),
    this.baseStat = const Value.absent(),
    this.effort = const Value.absent(),
  });
  IPokemonStatsEntityCompanion.insert({
    this.pokemonName = const Value.absent(),
    this.name = const Value.absent(),
    this.id = const Value.absent(),
    this.baseStat = const Value.absent(),
    this.effort = const Value.absent(),
  });
  static Insertable<PokemonStat> custom({
    Expression<String?>? pokemonName,
    Expression<String?>? name,
    Expression<int>? id,
    Expression<int?>? baseStat,
    Expression<int?>? effort,
  }) {
    return RawValuesInsertable({
      if (pokemonName != null) 'pokemon_name': pokemonName,
      if (name != null) 'name': name,
      if (id != null) 'id': id,
      if (baseStat != null) 'base_stat': baseStat,
      if (effort != null) 'effort': effort,
    });
  }

  IPokemonStatsEntityCompanion copyWith(
      {Value<String?>? pokemonName,
      Value<String?>? name,
      Value<int>? id,
      Value<int?>? baseStat,
      Value<int?>? effort}) {
    return IPokemonStatsEntityCompanion(
      pokemonName: pokemonName ?? this.pokemonName,
      name: name ?? this.name,
      id: id ?? this.id,
      baseStat: baseStat ?? this.baseStat,
      effort: effort ?? this.effort,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (pokemonName.present) {
      map['pokemon_name'] = Variable<String?>(pokemonName.value);
    }
    if (name.present) {
      map['name'] = Variable<String?>(name.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (baseStat.present) {
      map['base_stat'] = Variable<int?>(baseStat.value);
    }
    if (effort.present) {
      map['effort'] = Variable<int?>(effort.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IPokemonStatsEntityCompanion(')
          ..write('pokemonName: $pokemonName, ')
          ..write('name: $name, ')
          ..write('id: $id, ')
          ..write('baseStat: $baseStat, ')
          ..write('effort: $effort')
          ..write(')'))
        .toString();
  }
}

class $IPokemonStatsEntityTable extends IPokemonStatsEntity
    with TableInfo<$IPokemonStatsEntityTable, PokemonStat> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $IPokemonStatsEntityTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _pokemonNameMeta =
      const VerificationMeta('pokemonName');
  @override
  late final GeneratedColumn<String?> pokemonName = GeneratedColumn<String?>(
      'pokemon_name', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _baseStatMeta = const VerificationMeta('baseStat');
  @override
  late final GeneratedColumn<int?> baseStat = GeneratedColumn<int?>(
      'base_stat', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _effortMeta = const VerificationMeta('effort');
  @override
  late final GeneratedColumn<int?> effort = GeneratedColumn<int?>(
      'effort', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [pokemonName, name, id, baseStat, effort];
  @override
  String get aliasedName => _alias ?? 'i_pokemon_stats_entity';
  @override
  String get actualTableName => 'i_pokemon_stats_entity';
  @override
  VerificationContext validateIntegrity(Insertable<PokemonStat> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('pokemon_name')) {
      context.handle(
          _pokemonNameMeta,
          pokemonName.isAcceptableOrUnknown(
              data['pokemon_name']!, _pokemonNameMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('base_stat')) {
      context.handle(_baseStatMeta,
          baseStat.isAcceptableOrUnknown(data['base_stat']!, _baseStatMeta));
    }
    if (data.containsKey('effort')) {
      context.handle(_effortMeta,
          effort.isAcceptableOrUnknown(data['effort']!, _effortMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PokemonStat map(Map<String, dynamic> data, {String? tablePrefix}) {
    return PokemonStat.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $IPokemonStatsEntityTable createAlias(String alias) {
    return $IPokemonStatsEntityTable(attachedDatabase, alias);
  }
}

abstract class _$AppDB extends GeneratedDatabase {
  _$AppDB(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $IPokemonDetailsEntityTable iPokemonDetailsEntity =
      $IPokemonDetailsEntityTable(this);
  late final $IPokemonAbilitiesEntityTable iPokemonAbilitiesEntity =
      $IPokemonAbilitiesEntityTable(this);
  late final $IPokemonMoveEntityTable iPokemonMoveEntity =
      $IPokemonMoveEntityTable(this);
  late final $IPokemonTypeEntityTable iPokemonTypeEntity =
      $IPokemonTypeEntityTable(this);
  late final $IPokemonStatsEntityTable iPokemonStatsEntity =
      $IPokemonStatsEntityTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        iPokemonDetailsEntity,
        iPokemonAbilitiesEntity,
        iPokemonMoveEntity,
        iPokemonTypeEntity,
        iPokemonStatsEntity
      ];
}
